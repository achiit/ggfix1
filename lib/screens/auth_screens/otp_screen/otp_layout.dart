import 'package:fuzzy/plugin_list.dart';
import '../../../../config.dart';

class OtpLayout extends StatelessWidget {
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onSubmitted;
  final TextEditingController? controller;
  final PinTheme? errorPinTheme, defaultPinTheme, focusedPinTheme;

  const OtpLayout(
      {Key? key,
      this.validator,
      this.controller,
      this.onSubmitted,
      this.defaultPinTheme,
      this.errorPinTheme,
      this.focusedPinTheme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<VerifyOtpProvider>(builder: (context1, otp, child) {
      return SizedBox(
          height: Sizes.s80,
          child: Pinput(
              errorTextStyle: appCss.dmPoppinsMedium14.textColor(Colors.red),
              keyboardType: TextInputType.number,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              length: 5,
              validator: validator,
              controller: controller,
              focusNode: FocusNode(),
              defaultPinTheme: otp.defaultTheme(context),
              onCompleted: (pin) {},
              focusedPinTheme: otp
                  .defaultTheme(context)
                  .copyWith(height: Sizes.s50, width: Sizes.s80),
              errorPinTheme: otp.defaultTheme(context).copyWith(
                  decoration: BoxDecoration(
                      color: appColor(context).appTheme.linkErrorColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(AppRadius.r8)))));
    });
  }
}
