import '../../config.dart';
import 'package:fuzzy/plugin_list.dart';

class VerifyOtpProvider with ChangeNotifier {
  TextEditingController otpController = TextEditingController();
  GlobalKey<FormState> otpKey = GlobalKey<FormState>();
  bool isBack = false;

  //otp button
  onOTP(context) {
    FocusManager.instance.primaryFocus?.unfocus();
    if (otpKey.currentState!.validate()) {
      otp(context);
    }
  }

//page load
  onReady(context) {
    dynamic data = ModalRoute.of(context)!.settings.arguments;
    isBack = data ?? false;
  }

  //otp
  otp(context) {
    if (isBack) {
      route.pop(context);
    } else {
      route.pushNamed(context, routeName.changePassword);
    }
    notifyListeners();
    onBack();
  }

  //onBack clear
  onBack() {
    otpController.text = "";
    notifyListeners();
  }

  //otp pin theme
  defaultTheme(context) {
    final defaultPinTheme = PinTheme(
        textStyle: appCss.dmPoppinsSemiBold18
            .textColor(appColor(context).appTheme.txtTransparentColor),
        width: Sizes.s76,
        height: Sizes.s50,
        decoration: BoxDecoration(
            color: appColor(context).appTheme.txtColor,
            borderRadius: BorderRadius.circular(AppRadius.r8),
            border: Border.all(color: appColor(context).appTheme.txtColor)));
    return defaultPinTheme;
  }
}
