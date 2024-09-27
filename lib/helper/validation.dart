import '../config.dart';

class Validation {
  RegExp digitRegex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  RegExp regex = RegExp("^([0-9]{4}|[0-9]{6})");
  RegExp passRegex = RegExp(
      "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@\$%^&*-]).{8,}\$");

  // Email Validation
  emailValidation(context, email) {
    if (email.isEmpty) {
      return language(context, appFonts.pleaseEnterEmail);
    } else if (!digitRegex.hasMatch(email)) {
      return language(context, appFonts.pleaseEnterValid);
    }
    return null;
  }

  // Password Validation
  passValidation(context, password) {
    if (password.isEmpty) {
      return language(context, appFonts.pleaseEnterPassword);
    }
    if (!password.contains(RegExp(r"[a-z]"))) {
      return language(context, appFonts.mustContainSmallCharacter);
    }
    if (!password.contains(RegExp(r"[A-Z]"))) {
      return language(context, appFonts.mustContainCapsCharacter);
    }
    if (!password.contains(RegExp(r"[0-9]"))) {
      return language(context, appFonts.mustContainNumeric);
    }
    if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return language(context, appFonts.mustContainSpecial);
    }
    if (password.toString().length < 8) {
      return language(context, appFonts.rangeContain);
    }

    return null;
  }

  //confirm Password Validation
  confirmPassValidation(context, password, pass) {
    if (password.isEmpty) {
      return language(context, appFonts.pleaseEnterPassword);
    }
    if (password != pass) {
      return language(context, appFonts.notMatch);
    }
    return null;
  }

  // name validation
  nameValidation(context, name) {
    if (name.isEmpty) {
      return language(context, appFonts.pleaseEnterName);
    }
    return null;
  }

  // Otp Validation
  otpValidation(context, value) {
    if (value!.isEmpty) {
      return language(context, appFonts.enterOtp);
    }
    if (!regex.hasMatch(value)) {
      return language(context, appFonts.enterValidOtp);
    }
    return null;
  }

  // Phone Number Validation
  phoneValidation(context, phoneNumber) {
    if (phoneNumber.isEmpty) {
      return language(context, appFonts.enterPhone);
    }
    if (phoneNumber.length < 10) {
      return language(context, appFonts.enterValidPhone);
    }
    if (!regex.hasMatch(phoneNumber)) {
      return language(context, appFonts.enterValidPhone);
    }
    return null;
  }

//focus node change
  fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
