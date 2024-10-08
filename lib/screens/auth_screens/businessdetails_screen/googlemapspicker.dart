import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:fuzzy/config.dart';
import 'package:fuzzy/plugin_list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GoogleMapsLocationPicker extends StatefulWidget {
  @override
  _GoogleMapsLocationPickerState createState() =>
      _GoogleMapsLocationPickerState();
}

class _GoogleMapsLocationPickerState extends State<GoogleMapsLocationPicker> {
  GoogleMapController? _controller;
  LatLng _currentPosition = LatLng(17.3850, 78.4867); // Default position
  TextEditingController _searchController = TextEditingController();
  TextEditingController buildingController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController localityController = TextEditingController();
  bool _locationSelected = false;

  final String googleApiKey = "AIzaSyCceJ_PFXKkrZC0vkJo1GPL1dD2IeB4NPI";

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    log("Getting current location...");
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      log(position.toString());
      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);
        _controller?.animateCamera(CameraUpdate.newLatLng(_currentPosition));
      });
      _getPlaceDetails(_currentPosition);
    } catch (e) {
      print("Error getting current location: $e");
      // Handle the error, maybe show a message to the user
    }
  }

  void _onCameraIdle() {
    _getPlaceDetails(_currentPosition);
  }

  void _onCameraMove(CameraPosition position) {
    setState(() {
      _currentPosition = position.target;
    });
  }

  Future<void> _getPlaceDetails(LatLng position) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${position.latitude},${position.longitude}&radius=50&key=$googleApiKey';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['results'].isNotEmpty) {
          final place = data['results'][0];
          final placeId = place['place_id'];
          await _getDetailedPlaceInfo(placeId);
        } else {
          _setFallbackLocationInfo(position);
        }
      } else {
        _setFallbackLocationInfo(position);
      }
    } catch (e) {
      print("Error getting place details: $e");
      _setFallbackLocationInfo(position);
    }
    setState(() {
      _locationSelected = true;
    });
  }

  Future<void> _getDetailedPlaceInfo(String placeId) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=name,formatted_address,address_component&key=$googleApiKey';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['result'] != null) {
          final result = data['result'];
          setState(() {
            _searchController.text = result['formatted_address'] ?? '';
            buildingController.text = result['name'] ?? '';
            streetController.text =
                _getAddressComponent(result['address_components'], 'route');
            localityController.text = _getAddressComponent(
                result['address_components'], 'sublocality');
          });
        }
      }
    } catch (e) {
      print("Error getting detailed place info: $e");
    }
  }

  String _getAddressComponent(List components, String type) {
    final component = components.firstWhere(
      (comp) => comp['types'].contains(type),
      orElse: () => null,
    );
    return component != null ? component['long_name'] : '';
  }

  void _setFallbackLocationInfo(LatLng position) {
    setState(() {
      _searchController.text = '${position.latitude}, ${position.longitude}';
      buildingController.text = 'Unknown Building';
      streetController.text = 'Unknown Street';
      localityController.text = 'Unknown Locality';
    });
  }

  Future<void> _getPlaceDetailsFromId(String placeId) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=geometry,formatted_address,name,address_component&key=$googleApiKey';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['result'] != null) {
          final result = data['result'];
          final lat = result['geometry']['location']['lat'];
          final lng = result['geometry']['location']['lng'];
          setState(() {
            _currentPosition = LatLng(lat, lng);
            _searchController.text = result['formatted_address'] ?? '';
            buildingController.text = result['name'] ?? '';
            streetController.text =
                _getAddressComponent(result['address_components'], 'route');
            localityController.text = _getAddressComponent(
                result['address_components'], 'sublocality');
          });
          _controller?.animateCamera(CameraUpdate.newLatLng(_currentPosition));
          _getPlaceDetails(_currentPosition);
        }
      }
    } catch (e) {
      print("Error getting place details: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition:
                CameraPosition(target: _currentPosition, zoom: 18),
            onMapCreated: (GoogleMapController controller) {
              _controller = controller;
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            onCameraMove: _onCameraMove,
            onCameraIdle: _onCameraIdle,
          ),
          Center(
            child: Icon(Icons.location_on, color: Colors.red, size: 36),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.25,
            minChildSize: 0.2,
            maxChildSize: 0.7,
            builder: (context, scrollController) {
              return Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: appColor(context).appTheme.primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: _locationSelected
                    ? _buildAddressForm(scrollController)
                    : _buildWaitingForLocation(scrollController),
              );
            },
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 10,
            right: 10,
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: appColor(context).appTheme.btnPrimaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          color: appColor(context).appTheme.backGroundColorMain,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Select Location",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: appColor(context).appTheme.whiteColor,
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(color: Colors.grey.withOpacity(0.2)),
                  ),
                  child: GooglePlaceAutoCompleteTextField(
                    textEditingController: _searchController,
                    googleAPIKey: googleApiKey,
                    inputDecoration: InputDecoration(
                      hintText: 'Search places, streets or localities...',
                      prefixIcon: Icon(Icons.search,
                          color: appColor(context).appTheme.lightText),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    ),
                    debounceTime: 800,
                    countries: ["in"],
                    isLatLngRequired: true,
                    getPlaceDetailWithLatLng: (prediction) {
                      if (prediction.placeId != null) {
                        _getPlaceDetailsFromId(prediction.placeId!);
                      } else {
                        print("Place ID is null");
                      }
                    },
                    itemClick: (prediction) {
                      _searchController.text = prediction.description!;
                      _searchController.selection = TextSelection.fromPosition(
                        TextPosition(offset: prediction.description!.length),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWaitingForLocation(ScrollController scrollController) {
    return ListView(
      controller: scrollController,
      children: [
        SizedBox(height: 20),
        Text(
          "Move the map to select a location...",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        Icon(Icons.location_on, size: 50, color: Colors.grey),
      ],
    );
  }

  Widget _buildAddressForm(ScrollController scrollController) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 10),
      controller: scrollController,
      children: [
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: appColor(context).appTheme.txtColor.withOpacity(0.9),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey.withOpacity(0.9)),
          ),
          child: Text(_searchController.text,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: appColor(context).appTheme.lightText)),
        ),
        SizedBox(height: 20),
        _buildAddressField("Building Name/Door Number", buildingController),
        SizedBox(height: 15),
        _buildAddressField("Street Name", streetController),
        SizedBox(height: 15),
        _buildAddressField("Locality", localityController),
        SizedBox(height: 30),
        ButtonCommon(
          title: language(
            context,
            appFonts.locationconfirm,
          ),
          onTap: () {
            Navigator.pop(context, {
              'address': _searchController.text,
              'building': buildingController.text,
              'street': streetController.text,
              'locality': localityController.text,
              'latitude': _currentPosition.latitude,
              'longitude': _currentPosition.longitude,
            });
          },
        )
      ],
    );
  }

  Widget _buildAddressField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: appColor(context).appTheme.lightText)),
        SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
              color: appColor(context).appTheme.whiteColor,
              borderRadius: BorderRadius.circular(8)),
          child: TextFieldCommon(
            controller: controller,
            hintText: "",
          ),
        ),
      ],
    );
  }
}
