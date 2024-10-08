import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fuzzy/helper/constants.dart';
import 'package:dio/dio.dart';
import 'package:fuzzy/config.dart';
import 'package:fuzzy/services/sharedprefsService.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class BusinessDetailsProvider with ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late AnimationController animationController;
  late Animation<double> animation;

  final TextEditingController shopNameController = TextEditingController();
  final TextEditingController ownerNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  final TextEditingController aadharNumberController = TextEditingController();
  final TextEditingController panNumberController = TextEditingController();
  final TextEditingController gstNumberController = TextEditingController();

  File? aadharDoc;
  File? panDoc;
  File? gstCertificate;
  File? rentalAgreement;
  File? shopImage;

  final SharedPrefsService _sharedPrefsService = SharedPrefsService();
  final Dio _dio = Dio();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void initAnimation(TickerProvider vsync) {
    animationController = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 1000),
    );
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    animationController.forward();
  }

  void disposeAnimation() {
    animationController.dispose();
  }

  Future<File> compressImage(File? file) async {
    if (file == null) return file!;

    try {
      final filePath = file.absolute.path;
      final lastIndex = filePath.lastIndexOf(RegExp(r'.jp'));
      final splitted = filePath.substring(0, (lastIndex));
      final outPath = "${splitted}_compressed.jpg";

      var result = await FlutterImageCompress.compressAndGetFile(
        file.absolute.path,
        outPath,
        quality: 70,
      );

      if (result != null) {
        log('Image compressed successfully: ${result.path}');
        return File(result.path);
      } else {
        log('Image compression failed, using original image');
        return file;
      }
    } catch (e) {
      log('Error during image compression: $e');
      log('Using original image due to compression error');
      return file;
    }
  }

  Future<void> submitForm(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      try {
        setLoading(true);

        final url = '${ApiConstants.baseUrl}/shop/register';
        final formData = FormData.fromMap({
          'shop_name': shopNameController.text,
          'owner_name': ownerNameController.text,
          'phone_number': phoneNumberController.text,
          'email': emailController.text,
          'address': addressController.text,
          'latitude': latitudeController.text,
          'longitude': longitudeController.text,
          'aadhar_number': aadharNumberController.text,
          'pan_number': panNumberController.text,
          'gst_number': gstNumberController.text,
        });

        // Compress and add file fields
        if (aadharDoc != null) {
          final compressedAadhar = await compressImage(aadharDoc);
          formData.files.add(MapEntry(
              'aadhar_doc_url',
              await MultipartFile.fromFile(compressedAadhar!.path,
                  filename: 'aadhar_doc.jpg')));
        }
        if (panDoc != null) {
          final compressedPan = await compressImage(panDoc);
          formData.files.add(MapEntry(
              'pan_doc_url',
              await MultipartFile.fromFile(compressedPan!.path,
                  filename: 'pan_doc.jpg')));
        }
        if (gstCertificate != null) {
          final compressedGst = await compressImage(gstCertificate);
          formData.files.add(MapEntry(
              'gst_certificate_url',
              await MultipartFile.fromFile(compressedGst!.path,
                  filename: 'gst_certificate.jpg')));
        }
        if (rentalAgreement != null) {
          final compressedRental = await compressImage(rentalAgreement);
          formData.files.add(MapEntry(
              'rental_agreement_url',
              await MultipartFile.fromFile(compressedRental!.path,
                  filename: 'rental_agreement.jpg')));
        }
        if (shopImage != null) {
          final compressedShopImage = await compressImage(shopImage);
          formData.files.add(MapEntry(
              'image',
              await MultipartFile.fromFile(compressedShopImage!.path,
                  filename: 'shop_image.jpg')));
        }

        // Add token to headers
        String? token = await _sharedPrefsService.getToken();
        _dio.options.headers['Authorization'] = 'Bearer $token';

        // Log the request details
        log('Request URL: $url');
        log('Request Headers: ${_dio.options.headers}');
        log('Request Fields: ${formData.fields}');
        log('Request Files: ${formData.files}');

        final response = await _dio.post(url, data: formData);

        // Log the response
        log('Response Status Code: ${response.statusCode}');
        log('Response Headers: ${response.headers}');
        log('Response Body: ${response.data}');

        if (response.statusCode == 201) {
          await _saveShopDetailsToPrefs(response.data['shop']);
          showToast('Shop registered successfully!');
          // Navigate to next screen or perform other actions
        } else {
          throw Exception(
              'Failed to register shop: ${response.data['message']}');
        }
      } on DioError catch (e) {
        log('Dio error during form submission: ${e.message}');
        showToast(
            'Error: An error occurred during form submission. Please try again.');
      } catch (e) {
        log('Error during form submission: $e');
        showToast(
            'Error: An error occurred during form submission. Please try again.');
      } finally {
        setLoading(false);
      }
    }
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
    );
  }

  Future<void> _saveShopDetailsToPrefs(Map<String, dynamic> shopDetails) async {
    await _sharedPrefsService.setString('shop_name', shopDetails['shop_name']);
    await _sharedPrefsService.setString(
        'owner_name', shopDetails['owner_name']);
    await _sharedPrefsService.setString(
        'phone_number', shopDetails['phone_number']);       //shop phone number
    await _sharedPrefsService.setString('email', shopDetails['email']);
    await _sharedPrefsService.setString('address', shopDetails['address']);
    await _sharedPrefsService.setString('latitude', shopDetails['latitude']);
    await _sharedPrefsService.setString('longitude', shopDetails['longitude']);
    await _sharedPrefsService.setString(
        'aadhar_number', shopDetails['aadhar_number']);
    await _sharedPrefsService.setString(
        'pan_number', shopDetails['pan_number']);
    await _sharedPrefsService.setString(
        'gst_number', shopDetails['gst_number']);
    await _sharedPrefsService.setString(
        'aadhar_doc_url', shopDetails['aadhar_doc_url']);
    await _sharedPrefsService.setString(
        'pan_doc_url', shopDetails['pan_doc_url']);
    await _sharedPrefsService.setString(
        'gst_certificate_url', shopDetails['gst_certificate_url']);
    await _sharedPrefsService.setString(
        'rental_agreement_url', shopDetails['rental_agreement_url']);
    await _sharedPrefsService.setString('image', shopDetails['image']);
  }
}
