import 'package:fuzzy/config.dart';
import 'package:fuzzy/plugin_list.dart';

class CartProvider with ChangeNotifier {
  List cartList = [];
  bool isVisible = true;
  String selectedValue = '';
  dynamic data;
  bool isBack = false;

//promo code select
  onCode(values) {
    data = values;
    notifyListeners();
  }

  String get selectedValueData => selectedValue;

//increment product
  void incrementProduct(int currentitem) {
    cartList[currentitem]['qty'] = cartList[currentitem]['qty'] + 1;
    notifyListeners();
  }

//decrement product
  void decrementProduct(int currentItem) {
    if (cartList[currentItem]['qty'] > 0) {
      cartList[currentItem]['qty']--;
      if (cartList[currentItem]['qty'] == 0) {
        cartList.removeAt(currentItem);
      }
      notifyListeners();
    }
  }

//remove product
  void removeProduct(int currentItem) {
    cartList.removeAt(currentItem);
    notifyListeners();
  }

//page load
  void onReady(BuildContext context) {
    final value = Provider.of<WishlistProvider>(context, listen: false);
    final valueHome = Provider.of<HomeProvider>(context, listen: false);
    final valueCategory = Provider.of<CategoryProvider>(context, listen: false);
    cartList = List.from(appArray.cartList);
    if (value.cartListData.isNotEmpty ||
        valueHome.cartListData.isNotEmpty ||
        valueCategory.cartListData.isNotEmpty) {
      cartList.addAll(value.cartListData);
      cartList.addAll(valueHome.cartListData);
      cartList.addAll(valueCategory.cartListData);
    }
    notifyListeners();
    dynamic data = ModalRoute.of(context)!.settings.arguments;
    isBack = data ?? false;
  }

  //Checkout Click Event
  clickOnCheckOut(context, isBack) {
    if (isBack) {
      route.pop(context);
    } else {
      route.pushNamed(context, routeName.shippingDetails);
    }
  }

//promo code
  clickPromoCode(context, value) {
    route
        .pushNamed(context, routeName.couponCode)
        .then((values) => value.onCode(values));
  }

  //onBack press
  onBackPress(canPop, context, dashboard) async {
    if (canPop) return;
    dashboard.moveTab(context, 0, isBack: true);
  }

  //button click event
  onBtnClick(context, isBack) {
    if (isBack) {
      route.pop(context);
    } else {
      route.pushNamed(context, routeName.checkOut);
    }
  }
}
