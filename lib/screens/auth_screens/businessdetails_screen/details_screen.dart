import 'dart:developer';
import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fuzzy/config.dart';
import 'package:fuzzy/plugin_list.dart';
import 'package:fuzzy/provider/auth_provider/businessdetails_provider.dart';
import 'package:fuzzy/screens/auth_screens/businessdetails_screen/googlemapspicker.dart';
import 'package:fuzzy/services/sharedprefsService.dart';
import 'package:fuzzy/widgets/common_loading.dart';
import 'package:permission_handler/permission_handler.dart';

class BusinessDetailsPage extends StatefulWidget {
  const BusinessDetailsPage({Key? key}) : super(key: key);

  @override
  _BusinessDetailsPageState createState() => _BusinessDetailsPageState();
}

class _BusinessDetailsPageState extends State<BusinessDetailsPage>
    with SingleTickerProviderStateMixin {
  late BusinessDetailsProvider provider;
  late SharedPrefsService sharedPrefsService;
  String? token;

  @override
  void initState() {
    super.initState();
    provider = BusinessDetailsProvider()..initAnimation(this);
    sharedPrefsService = SharedPrefsService();
    _getTokenAndLog();
  }

  Future<void> _getTokenAndLog() async {
    token = await sharedPrefsService.getToken();
    log("Token: $token");
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
      log('Location updated: ${result['address']}, Lat: ${result['latitude']}, Lng: ${result['longitude']}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: provider,
      child: Consumer2<BusinessDetailsProvider, ThemeService>(
        builder: (context, provider, theme, _) {
          return LoadingOverlay(
            isLoading: provider.isLoading,
            child: DirectionLayout(
              dChild: Scaffold(
                backgroundColor: isThemeColorReturnDark(context),
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
                                    color: isThemeColorReturn(context),
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
                                      controller:
                                          provider.phoneNumberController,
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
                                      labelText: language(
                                          context, appFonts.shopaddress),
                                      hintText: language(
                                          context, appFonts.shopaddress),
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
                                      controller:
                                          provider.aadharNumberController,
                                      labelText: language(
                                          context, appFonts.owneraadhar),
                                      hintText: language(
                                          context, appFonts.owneraadhar),
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
                                    _buildUploadSection(
                                      context: context,
                                      title: 'Aadhar Card',
                                      onTap: () =>
                                          _pickFile(FileType.image, (file) {
                                        setState(
                                            () => provider.aadharDoc = file);
                                      }),
                                      file: provider.aadharDoc,
                                    ),
                                    _buildUploadSection(
                                      context: context,
                                      title: 'PAN Card',
                                      onTap: () =>
                                          _pickFile(FileType.image, (file) {
                                        setState(() => provider.panDoc = file);
                                      }),
                                      file: provider.panDoc,
                                    ),
                                    _buildUploadSection(
                                      context: context,
                                      title: 'GST Certificate',
                                      onTap: () =>
                                          _pickFile(FileType.image, (file) {
                                        setState(() =>
                                            provider.gstCertificate = file);
                                      }),
                                      file: provider.gstCertificate,
                                    ),
                                    _buildUploadSection(
                                      context: context,
                                      title: 'Shop Image',
                                      onTap: () =>
                                          _pickFile(FileType.image, (file) {
                                        setState(
                                            () => provider.shopImage = file);
                                      }),
                                      file: provider.shopImage,
                                    ),
                                    _buildUploadSection(
                                      context: context,
                                      title: 'Rental Agreement',
                                      onTap: () =>
                                          _pickFile(FileType.image, (file) {
                                        setState(() =>
                                            provider.rentalAgreement = file);
                                      }),
                                      file: provider.rentalAgreement,
                                    ),
                                    const SizedBox(height: 30),
                                    ButtonCommon(
                                      title: language(context, appFonts.submit),
                                      onTap: () async {
                                        // Debug prints
                                        log('Shop Name: ${provider.shopNameController.text}');
                                        log('Owner Name: ${provider.ownerNameController.text}');
                                        log('Phone Number: ${provider.phoneNumberController.text}');
                                        log('Email: ${provider.emailController.text}');
                                        log('Address: ${provider.addressController.text}');
                                        log('Latitude: ${provider.latitudeController.text}');
                                        log('Longitude: ${provider.longitudeController.text}');
                                        log('Aadhar Number: ${provider.aadharNumberController.text}');
                                        log('PAN Number: ${provider.panNumberController.text}');
                                        log('GST Number: ${provider.gstNumberController.text}');

                                        await provider.submitForm(context);
                                      },
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
              color: isThemeColorReturn(context),
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          TextFieldCommon(
            controller: controller,
            keyboardType: keyboardType,
            hintText: hintText,
            hintStyle: TextStyle(
              color: isThemeColorReturnDark(context),
            ),
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
            onChanged: (value) {
              log('$labelText changed to: $value');
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
                onChanged: (value) {
                  log('$labelText changed to: $value');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUploadSection({
    required BuildContext context,
    required String title,
    required VoidCallback onTap,
    File? file,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isThemeColorReturn(context),
            ),
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: onTap,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                color: isThemeColorReturnDark(context),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: appColor(context).appTheme.lightText),
              ),
              child: file != null
                  ? _buildFilePreview(file)
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.upload_file,
                          color: appColor(context).appTheme.btnPrimaryColor,
                          size: 40,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Tap to upload',
                          style: TextStyle(
                            color: isThemeColorReturn(context),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilePreview(File file) {
    if (file.path.toLowerCase().endsWith('.pdf')) {
      return Center(
        child: Text(
          'PDF Selected',
          style: TextStyle(color: isThemeColorReturn(context)),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.file(file, fit: BoxFit.cover)),
      );
    }
  }

  Future<void> _pickFile(FileType fileType, Function(File) onFilePicked) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: fileType,
      allowMultiple: false,
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      onFilePicked(file);
      print('File picked: ${file.path}');
    } else {
      print('File picking cancelled');
    }
  }
}
