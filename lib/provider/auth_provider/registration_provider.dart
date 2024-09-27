import 'dart:developer';

import '../../config.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistrationProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _verificationId;

  GlobalKey<FormState> registrationKey = GlobalKey<FormState>();

  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final FocusNode phoneFocus = FocusNode();
  final FocusNode otpFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  bool isNewPassword = true;
  bool isPhoneValid = false;
  bool isOtpSent = false;
  bool isOtpCorrect = false;

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
      await _auth.verifyPhoneNumber(
        phoneNumber: '+91$phoneNumber', // Assuming Indian phone numbers
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          showToast('Auto-verification completed');
          isOtpCorrect = true;
          notifyListeners();
        },
        verificationFailed: (FirebaseAuthException e) {
          showToast('Verification failed: ${e.message}');
        },
        codeSent: (String verificationId, int? resendToken) {
          _verificationId = verificationId;
          isOtpSent = true;
          showToast('OTP sent successfully');
          notifyListeners();
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationId = verificationId;
        },
      );
    } catch (e) {
      log(e.toString());
      showToast('Error sending OTP: $e');
    }
  }

  Future<void> verifyOTP(String otp) async {
    if (otp.length != 6) {
      showToast('Please enter a valid 6-digit OTP');
      return;
    }

    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: otp,
      );

      await _auth.signInWithCredential(credential);
      isOtpCorrect = true;
      showToast('OTP verified successfully');
      passwordFocus.requestFocus();
    } catch (e) {
      isOtpCorrect = false;
      showToast('Invalid OTP. Please try again.');
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

  void onRegistration(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
    if (registrationKey.currentState!.validate() && isOtpCorrect) {
      registration(context);
    } else {
      showToast('Please complete all steps before registering');
    }
  }

  void registration(BuildContext context) {
    // Implement registration logic here
    showToast('Registration successful!');
    notifyListeners();
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
