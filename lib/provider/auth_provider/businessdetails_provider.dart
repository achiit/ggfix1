import 'package:flutter/material.dart';
import 'package:fuzzy/config.dart';


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

  void initAnimation(TickerProvider vsync) {
    animationController = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    animationController.forward();
  }

  void disposeAnimation() {
    animationController.dispose();
  }

  void submitForm(BuildContext context) {
    if (formKey.currentState!.validate()) {
      // Process the form data
      print('Form submitted successfully!');
      final businessDetails = {
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
      };
      print(businessDetails);
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Business details submitted successfully!')),
      );
    }
  }
}
