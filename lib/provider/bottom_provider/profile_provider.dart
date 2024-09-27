import 'package:fuzzy/config.dart';

class ProfileProvider with ChangeNotifier {
  int selectIndex = 0;
  List profileListOne = [];
  bool isBack = false;

  //profile sub layout load
  void onReady(context) {
    profileListOne = appArray.profileList;
    notifyListeners();
    dynamic data = ModalRoute.of(context)!.settings.arguments;
    isBack = data ?? false;
  }

//profile list select list
  onTapList(dynamic data, BuildContext context) {
    if (data['title'] == appFonts.wishlist ||
        data['title'] == appFonts.payment ||
        data['title'] == appFonts.saveAddress) {
      route.pushNamed(context, data['route'], arg: true);
    }else{
      route.pushNamed(context, data['route']);
    }
  }

  //device back press
  onDeviceBack(context, isBack) async {
    if (isBack) {
      Navigator.canPop(context);
    } else {
      isDashboard(context);
    }
  }

  //backpress
  onBackPress(context, isBack) async {
    if (isBack) {
      route.pop(context);
    } else {
      isDashboard(context);
    }
  }
}
