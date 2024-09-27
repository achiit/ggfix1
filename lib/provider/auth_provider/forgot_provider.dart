import 'package:fuzzy/config.dart';

class ForgotProvider with ChangeNotifier {
  GlobalKey<FormState> forgotKey = GlobalKey<FormState>();
  TextEditingController emailTextController = TextEditingController();
  final FocusNode emailTextFocus = FocusNode();
  bool isBack=false;

  //forgot button
  onForgot(context) {
    FocusManager.instance.primaryFocus?.unfocus();
    if (forgotKey.currentState!.validate()) {
      forgot(context);
    }
  }
  //page load
  onReady(context){
    dynamic data= ModalRoute.of(context)!.settings.arguments ;
    isBack = data ??false;
  }
  //forgot
  forgot(context) {
    if (isBack) {
      route.pop(context);
    }  else {
      route.pushNamed(context, routeName.otpVerify);
    }
    notifyListeners();
    onBack();
  }
//onBack clear
  onBack() {
    emailTextController.text = "";
    notifyListeners();
  }


}
