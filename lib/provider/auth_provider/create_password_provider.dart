import '../../config.dart';
import '../../plugin_list.dart';

class CreatePasswordProvider with ChangeNotifier {
  GlobalKey<FormState> changePasswordKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  FocusNode passwordFocus = FocusNode();
  FocusNode changePasswordFocus = FocusNode();

  bool isNewPassword = true,
      isConfirmPassword = true,
      isCheck = false,
      isBack = false;

  //new password see tap
  newPasswordSeenTap() {
    isNewPassword = !isNewPassword;
    notifyListeners();
  }

  //confirm password see tap
  confirmPasswordSeenTap() {
    isConfirmPassword = !isConfirmPassword;
    notifyListeners();
  }

//change password
  onChangePassword(context) {
    FocusManager.instance.primaryFocus?.unfocus();
    if (changePasswordKey.currentState!.validate()) {
      changepassword(context);
    }
  }

//page load
  onReady(context) {
    dynamic data = ModalRoute.of(context)!.settings.arguments;
    isBack = data ?? false;
  }

  //changepassword
  changepassword(context) {
    if (isBack) {
      route.pop(context);
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => MultiProvider(providers: [
                    ChangeNotifierProvider(create: (_) => LoginProvider()),
                    ChangeNotifierProvider(create: (_) => ForgotProvider()),
                  ], child: const LoginScreen())),
          ModalRoute.withName(routeName.login));
    }
    notifyListeners();
    onBack();
  }

//onBack clear
  onBack() {
    passwordController.text = "";
    confirmPasswordController.text = "";
    notifyListeners();
  }

  @override
  void dispose() {
    changePasswordKey.currentState!.dispose();
    super.dispose();
  }
}
