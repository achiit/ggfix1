import '../../config.dart';

class PageListProvider with ChangeNotifier {
  int selectedIndex = 0;

  //slected index
  onSelectedList(index) {
    selectedIndex = index;
    notifyListeners();
  }

  //selected page list
  onSelectedListPage(dynamic data, BuildContext context) {
    if (data['subtitle'] == appFonts.createAccount ||
        data['subtitle'] == appFonts.forgotPassword ||
        data['subtitle'] == appFonts.onboarding ||
        data['subtitle'] == appFonts.login ||
        data['subtitle'] == appFonts.otp ||
        data['subtitle'] == appFonts.resetPassword ||
        data['subtitle'] == appFonts.categories ||
        data['subtitle'] == appFonts.cart ||
        data['subtitle'] == appFonts.checkOut ||
        data['subtitle'] == appFonts.orderTracker ||
        data['subtitle'] == appFonts.payment ||
        data['subtitle'] == appFonts.orderDetail ||
        data['subtitle'] == appFonts.notification ||
        data['subtitle'] == appFonts.profile ||
        data['subtitle'] == appFonts.wishlist) {
      route.pushNamed(context, data['route'], arg: true);
    } else {
      route.pushNamed(context, data['route']);
    }
  }
}
