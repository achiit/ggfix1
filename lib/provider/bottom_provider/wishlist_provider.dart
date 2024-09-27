import '../../config.dart';
import '../../plugin_list.dart';

class WishlistProvider with ChangeNotifier {
  List cartListData = [];
  List wishListData = [];
  List newArrivalList = [];
  bool isBack = false;

  //load page
  void onReady(BuildContext context) {
    final valueNewArrival = Provider.of<HomeProvider>(context, listen: false);
    wishListData = List.from(appArray.wishlist);
    if (valueNewArrival.wishListHome.isNotEmpty) {
      wishListData.addAll(valueNewArrival.wishListHome);
    }
    notifyListeners();
    dynamic data = ModalRoute.of(context)!.settings.arguments;
    isBack = data ?? false;
  }

//move to cart
  void moveToCart(int index, context) {
    if (index >= 0 && index < wishListData.length) {
      Map<String, dynamic>? itemToMove = wishListData[index];
      if (itemToMove != null &&
          itemToMove['image'] != null &&
          itemToMove['title'] != null &&
          itemToMove['qty'] != null &&
          itemToMove['colorName'] != null &&
          itemToMove['finalAmount'] != null &&
          itemToMove['amount'] != null) {
        String itemImage = itemToMove['image'].toString();
        String itemTitle = itemToMove['title'].toString();
        int itemQty = itemToMove["qty"];
        String itemColorName = itemToMove['colorName'].toString();
        String itemAmount = itemToMove['finalAmount'].toString();
        String itemDiscount = itemToMove['amount'].toString();

        int existingIndex = cartListData.indexWhere((item) =>
            item['title'] == itemTitle &&
            item['finalAmount'] == itemAmount &&
            item['amount'] == itemDiscount &&
            item['colorName'] == itemColorName);

        if (existingIndex != -1) {
          cartListData[existingIndex]['qty'] += itemQty;
        } else {
          cartListData.add({
            "image": itemImage,
            "title": itemTitle,
            "qty": itemQty,
            "colorName": itemColorName,
            "finalAmount": itemAmount,
            "amount": itemDiscount,
          });
        }
        wishListData.removeAt(index);
        itemToMove['isInWishlist'] = false;
      }
      route.pushNamed(context, routeName.cartView);
      notifyListeners();
    }
  }

  //remove product
  void removeProduct(int currentItem) {
    wishListData.removeAt(currentItem);
    notifyListeners();
  }

  //back press
  onBackPress(context, isBack, dashboard) async {
    if (isBack) {
      Navigator.canPop(context);
    } else {
      dashboard.moveTab(context, 0);
    }
  }

  //device back press
  onDeviceBack(context, isBack) {
    if (isBack) {
      Navigator.pop(context);
    } else {
      isDashboard(context);
    }
  }
}
