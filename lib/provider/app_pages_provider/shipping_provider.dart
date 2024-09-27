import '../../config.dart';

class ShippingProvider with ChangeNotifier {
  int selectIndex = 0;
  int selectShippingOptionIndex = 0;
  bool isBack = false;
  List addressList = [];

  //select shipping details layout index
  onSelectShippingMethod(index) {
    selectIndex = index;
    notifyListeners();
  }

  //choose shipping index layout
  onSelectShippingOptionMethod(index) {
    selectShippingOptionIndex = index;
    notifyListeners();
  }

  //load page
  onReady(context) {
    addressList = List.from(appArray.shippingDetailsList);
    notifyListeners();
    dynamic data = ModalRoute.of(context)!.settings.arguments;
    isBack = data ?? false;
  }

//remove shipping detail address
  void removeAddress(int currentItem) {
    addressList.removeAt(currentItem);
    notifyListeners();
  }

  //on Button Click
  onBtnClick(shipping, context) {
    if (shipping.isBack) {
      route.pop(context);
    } else {
      route.pushNamed(context, routeName.payment);
    }
  }

  //on button click
  onBtnTrackingClick(shipping, context) {
    if (shipping.isBack) {
      route.pop(context);
    } else {
      isDashboard(context);
    }
  }
}
