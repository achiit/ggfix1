import '../../../config.dart';
import 'package:fuzzy/plugin_list.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter/material.dart';

class TextFieldLayoutRegistration extends StatelessWidget {
  const TextFieldLayoutRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RegistrationProvider>(
        builder: (context1, registration, child) {
      return Stack(children: [
        Column(children: [
          CommonTextLayout(
              text: language(context, appFonts.email), isStyle: true),
          const VSpace(Sizes.s6),
          TextFieldCommon(
            keyboardType: TextInputType.phone,
            focusNode: registration.phoneFocus,
            controller: registration.phoneController,
            maxLength: 10,
            hintText: language(context, appFonts.hintPhoneNumber),
            prefixIcon: SvgPicture.asset(
              svgAssets.iconPhone,
              fit: BoxFit.scaleDown,
              color: Colors.white.withOpacity(0.4),
            ),
            onChanged: (value) => registration.validatePhoneNumber(value),
            validator: (value) => Validation().phoneValidation(context, value),
          ),
          const VSpace(Sizes.s15),
          if (registration.isPhoneValid && !registration.isOtpSent)
            ElevatedButton(
              onPressed: () =>
                  registration.sendOTP(registration.phoneController.text),
              child: Text(language(context, "appFonts.sendOTP")),
            ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            height: registration.isOtpSent ? 120 : 0,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonTextLayout(
                      text: language(context, " appFonts.otpVerification"),
                      isStyle: true),
                  const VSpace(Sizes.s6),
                  Pinput(
                    length: 6,
                    controller: registration.otpController,
                    focusNode: registration.otpFocus,
                    defaultPinTheme: PinTheme(
                      width: 56,
                      height: 56,
                      textStyle: TextStyle(
                        fontSize: 20,
                        color: appColor(context).appTheme.whiteColor,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: appColor(context).appTheme.whiteColor),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    focusedPinTheme: PinTheme(
                      width: 56,
                      height: 56,
                      textStyle: TextStyle(
                        fontSize: 20,
                        color: appColor(context).appTheme.whiteColor,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onCompleted: (pin) => registration.verifyOTP(pin),
                  ),
                ],
              ),
            ),
          ),
          const VSpace(Sizes.s15),
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            height: registration.isOtpCorrect ? 100 : 0,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonTextLayout(
                      text: language(context, appFonts.password),
                      isStyle: true),
                  const VSpace(Sizes.s6),
                  TextFieldCommon(
                    controller: registration.passwordController,
                    keyboardType: TextInputType.text,
                    focusNode: registration.passwordFocus,
                    hintText: language(context, appFonts.hintPassword),
                    obscureText: registration.isNewPassword,
                    prefixIcon: SvgPicture.asset(svgAssets.iconLock,
                        fit: BoxFit.scaleDown),
                    suffixIcon: CommonWidget()
                        .passwordSVG(registration.isNewPassword,
                            svgAssets.iconHide, svgAssets.iconEye)
                        .inkWell(
                            onTap: () => registration.newPasswordSeenTap()),
                  ),
                ],
              ),
            ),
          ),
          const VSpace(Sizes.s15),
          if (registration.isOtpCorrect)
            ElevatedButton(
              onPressed: () => registration.onRegistration(context),
              child: Text(language(context, appFonts.signUp)),
            ),
        ])
      ]);
    });
  }
}
