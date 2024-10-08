import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fuzzy/config.dart';
import 'package:fuzzy/plugin_list.dart';
import 'package:fuzzy/provider/auth_provider/businessdetails_provider.dart';
import 'package:fuzzy/screens/auth_screens/businessdetails_screen/googlemapspicker.dart';
import 'package:permission_handler/permission_handler.dart';

class BusinessDetailsPage extends StatefulWidget {
  const BusinessDetailsPage({Key? key}) : super(key: key);

  @override
  _BusinessDetailsPageState createState() => _BusinessDetailsPageState();
}

class _BusinessDetailsPageState extends State<BusinessDetailsPage>
    with SingleTickerProviderStateMixin {
  late BusinessDetailsProvider provider;

  @override
  void initState() {
    super.initState();
    provider = BusinessDetailsProvider()..initAnimation(this);
  }

  @override
  void dispose() {
    provider.disposeAnimation();
    super.dispose();
  }

  Future<void> checkLocationPermission() async {
    final status = await Permission.location.status;
    if (!status.isGranted) {
      log("Location permission not granted");
      await Permission.location.request();
    } else {
      log('Location permission already granted');
      _openLocationPicker();
    }
  }

  Future<void> _openLocationPicker() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GoogleMapsLocationPicker()),
    );

    if (result != null) {
      setState(() {
        provider.addressController.text = result['address'];
        provider.latitudeController.text = result['latitude'].toString();
        provider.longitudeController.text = result['longitude'].toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: provider,
      child: Consumer<BusinessDetailsProvider>(
        builder: (context, provider, _) {
          return DirectionLayout(
            dChild: Scaffold(
              backgroundColor: appColor(context).appTheme.primaryColor,
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: provider.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(
                                language(context, appFonts.businessdetails),
                                textStyle: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: appColor(context).appTheme.whiteColor,
                                ),
                                speed: const Duration(milliseconds: 100),
                              ),
                            ],
                            totalRepeatCount: 1,
                          ),
                          const SizedBox(height: 30),
                          FadeTransition(
                            opacity: provider.animation,
                            child: SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0, 0.5),
                                end: Offset.zero,
                              ).animate(provider.animation),
                              child: Column(
                                children: [
                                  _buildTextField(
                                    context: context,
                                    controller: provider.shopNameController,
                                    labelText:
                                        language(context, appFonts.shopname),
                                    hintText:
                                        language(context, appFonts.shopname),
                                    prefixIcon: svgAssets.iconShippingBox,
                                  ),
                                  _buildTextField(
                                    context: context,
                                    controller: provider.ownerNameController,
                                    labelText:
                                        language(context, appFonts.shopowner),
                                    hintText:
                                        language(context, appFonts.shopowner),
                                    prefixIcon: svgAssets.iconProfile,
                                  ),
                                  _buildTextField(
                                    context: context,
                                    controller: provider.phoneNumberController,
                                    labelText:
                                        language(context, appFonts.shopphone),
                                    hintText:
                                        language(context, appFonts.shopphone),
                                    prefixIcon: svgAssets.iconPhone,
                                    keyboardType: TextInputType.phone,
                                  ),
                                  _buildTextField(
                                    context: context,
                                    controller: provider.emailController,
                                    labelText:
                                        language(context, appFonts.shopemail),
                                    hintText:
                                        language(context, appFonts.shopemail),
                                    prefixIcon: svgAssets.iconEmail,
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                  _buildLocationField(
                                    context: context,
                                    controller: provider.addressController,
                                    labelText:
                                        language(context, appFonts.shopaddress),
                                    hintText:
                                        language(context, appFonts.shopaddress),
                                    prefixIcon: svgAssets.iconLocation,
                                    onTap: checkLocationPermission,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: _buildTextField(
                                          context: context,
                                          controller:
                                              provider.latitudeController,
                                          labelText:
                                              language(context, "Latitude"),
                                          hintText:
                                              language(context, "Latitude"),
                                          prefixIcon: svgAssets.iconLocation,
                                          keyboardType: TextInputType.number,
                                          enabled: false,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: _buildTextField(
                                          context: context,
                                          controller:
                                              provider.longitudeController,
                                          labelText:
                                              language(context, "Longitude"),
                                          hintText:
                                              language(context, "Longitude"),
                                          prefixIcon: svgAssets.iconLocation,
                                          keyboardType: TextInputType.number,
                                          enabled: false,
                                        ),
                                      ),
                                    ],
                                  ),
                                  _buildTextField(
                                    context: context,
                                    controller: provider.aadharNumberController,
                                    labelText:
                                        language(context, appFonts.owneraadhar),
                                    hintText:
                                        language(context, appFonts.owneraadhar),
                                    prefixIcon: svgAssets.iconCard,
                                  ),
                                  _buildTextField(
                                    context: context,
                                    controller: provider.panNumberController,
                                    labelText:
                                        language(context, appFonts.ownerpan),
                                    hintText:
                                        language(context, appFonts.ownerpan),
                                    prefixIcon: svgAssets.iconCard,
                                  ),
                                  _buildTextField(
                                    context: context,
                                    controller: provider.gstNumberController,
                                    labelText:
                                        language(context, appFonts.ownergst),
                                    hintText:
                                        language(context, appFonts.ownergst),
                                    prefixIcon: svgAssets.iconCard,
                                  ),
                                  const SizedBox(height: 30),
                                  ButtonCommon(
                                    title: language(context, appFonts.submit),
                                    onTap: () => provider.submitForm(context),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextField({
    required BuildContext context,
    required TextEditingController controller,
    required String labelText,
    required String hintText,
    required String prefixIcon,
    TextInputType keyboardType = TextInputType.text,
    bool enabled = true,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: TextStyle(
              color: appColor(context).appTheme.whiteColor,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          TextFieldCommon(
            controller: controller,
            keyboardType: keyboardType,
            hintText: hintText,
            prefixIcon: SvgPicture.asset(prefixIcon,
                fit: BoxFit.scaleDown,
                color: appColor(context).appTheme.whiteColor),
            enabled: enabled,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return language(context, appFonts.validation);
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLocationField({
    required BuildContext context,
    required TextEditingController controller,
    required String labelText,
    required String hintText,
    required String prefixIcon,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: TextStyle(
              color: appColor(context).appTheme.whiteColor,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: onTap,
            child: AbsorbPointer(
              child: TextFieldCommon(
                controller: controller,
                hintText: hintText,
                prefixIcon: SvgPicture.asset(
                  prefixIcon,
                  fit: BoxFit.scaleDown,
                  color: appColor(context).appTheme.whiteColor,
                ),
                suffixIcon: Icon(Icons.map,
                    color: appColor(context).appTheme.whiteColor),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return language(context, appFonts.validation);
                  }
                  return null;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
