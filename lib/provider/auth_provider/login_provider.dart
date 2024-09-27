import 'package:fuzzy/config.dart';
import '../../plugin_list.dart';

class LoginProvider with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  bool isNewPassword = true;
  bool checkedValue = false, isBack = false;

//login button
  onLogin(context) {
    FocusManager.instance.primaryFocus?.unfocus();
    if (loginKey.currentState!.validate()) {
      login(context);
    }
  }

//page load
  onReady(context) {
    dynamic data = ModalRoute.of(context)!.settings.arguments;
    isBack = data ?? false;
  }

  //login
  login(context) {
    if (isBack) {
      route.pop(context);
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => MultiProvider(providers: [
                    ChangeNotifierProvider(create: (_) => DashboardProvider()),
                  ], child: const Dashboard())),
          ModalRoute.withName(routeName.dashboard));
    }

    notifyListeners();
    onBack();
  }

//onBack clear
  onBack() {
    emailController.text = "";
    passwordController.text = "";
    notifyListeners();
  }

  //new password see tap
  newPasswordSeenTap() {
    isNewPassword = !isNewPassword;
    notifyListeners();
  }

  //remember me
  bool isCheck() {
    checkedValue = !checkedValue;
    notifyListeners();
    return checkedValue;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
