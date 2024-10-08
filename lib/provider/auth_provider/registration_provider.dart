import 'dart:developer';
import 'dart:convert';
import 'package:fuzzy/screens/auth_screens/businessdetails_screen/details_screen.dart';
import 'package:fuzzy/services/authservice.dart';
import 'package:fuzzy/services/sharedprefsService.dart';

import '../../config.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class RegistrationProvider with ChangeNotifier {
  String? _verificationId;
  final ApiService _apiService = ApiService();
  final SharedPrefsService _sharedPrefsService = SharedPrefsService();
  GlobalKey<FormState> registrationKey = GlobalKey<FormState>();

  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  final FocusNode phoneFocus = FocusNode();
  final FocusNode otpFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  bool isNewPassword = true;
  bool isPhoneValid = false;
  bool isOtpSent = false;
  bool isOtpCorrect = false;

  final String custId = 'C-8D066D46FB5F4C3';
  final String authToken =
      'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJDLThEMDY2RDQ2RkI1RjRDMyIsImlhdCI6MTcyNzQ0Mzc5NywiZXhwIjoxODg1MTIzNzk3fQ.6xqcaJlEJbn6nESn2plXpQdUJjdp25J3Nel5Mrwx3XhM4mJPUq4_vhDjk0lCQBpb3B9b3MY9Y4q6pd4rGJIj_w';

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
    );
  }

  Future<void> sendOTP(String phoneNumber) async {
    if (phoneNumber.length != 10) {
      showToast('Please enter a valid 10-digit phone number');
      return;
    }

    try {
      final response = await http.post(
        Uri.parse(
            'https://cpaas.messagecentral.com/verification/v3/send?countryCode=91&otpLength=6&flowType=SMS&mobileNumber=$phoneNumber'),
        headers: {'authToken': authToken},
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        if (jsonResponse['message'] == 'SUCCESS') {
          _verificationId = jsonResponse['data']['verificationId'];
          isOtpSent = true;
          showToast('OTP sent successfully');
          notifyListeners();
        } else {
          showToast('Failed to send OTP: ${jsonResponse['message']}');
        }
      } else {
        log(response.body);
        showToast('Failed to send OTP. Please try again.');
      }
    } catch (e) {
      log(e.toString());
      showToast('Error sending OTP: $e');
    }
  }

  Future<void> registration(BuildContext context) async {
    try {
      final response = await _apiService.register(
        phoneController.text,
        passwordController.text,
      );

      if (response.containsKey('token')) {
        await _sharedPrefsService.saveToken(response['token']);
        showToast('Registration successful!');

        // Navigate to the BusinessDetailsPage
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => BusinessDetailsPage()),
        );
      } else {
        showToast('Registration failed. Please try again.');
      }
    } catch (e) {
      log('Registration error: $e');
      showToast('An error occurred during registration. Please try again.');
    }
    notifyListeners();
  }

  Future<void> verifyOTP(String otp) async {
    if (otp.length != 6) {
      showToast('Please enter a valid 6-digit OTP');
      return;
    }

    try {
      final response = await http.get(
        Uri.parse(
            'https://cpaas.messagecentral.com/verification/v3/validateOtp?verificationId=$_verificationId&code=$otp'),
        headers: {'authToken': authToken},
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        if (jsonResponse['message'] == 'SUCCESS') {
          isOtpCorrect = true;
          showToast('OTP verified successfully');
          passwordFocus.requestFocus();
        } else {
          isOtpCorrect = false;
          showToast('Invalid OTP. Please try again.');
        }
      } else {
        isOtpCorrect = false;
        showToast('Failed to verify OTP. Please try again.');
      }
    } catch (e) {
      isOtpCorrect = false;
      showToast('Error verifying OTP: $e');
    }
    notifyListeners();
  }

  void validatePhoneNumber(String value) {
    isPhoneValid = value.length == 10 && int.tryParse(value) != null;
    if (!isPhoneValid) {
      isOtpSent = false;
      isOtpCorrect = false;
    }
    notifyListeners();
  }

  Future<void> onRegistration(BuildContext context) async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (registrationKey.currentState!.validate() && isOtpCorrect) {
      isLoading = true;
      notifyListeners();

      await registration(context);

      isLoading = false;
      notifyListeners();
    } else {
      showToast('Please complete all steps before registering');
    }
  }

  void onBack() {
    phoneController.clear();
    otpController.clear();
    passwordController.clear();
    isPhoneValid = false;
    isOtpSent = false;
    isOtpCorrect = false;
    notifyListeners();
  }

  void newPasswordSeenTap() {
    isNewPassword = !isNewPassword;
    notifyListeners();
  }
}
