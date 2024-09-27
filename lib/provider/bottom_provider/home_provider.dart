import 'package:fuzzy/config.dart';

class HomeProvider with ChangeNotifier {
  TextEditingController searchCtrl = TextEditingController();
  bool isDrawerOpen = false;

  int selectIndex = 0;
  List cartListData = [];
  List newArrivalList = [];
  List newTrendFurniture = [];
  List wishListHome = [];
  List newOfferZone = [];
  List newFurnitureDecor = [];
  bool isSelected = false;
  List newFurnitureType = [];

  //slected index open another index page
  onSelectedValue(int index, context) {
    selectIndex = index;
    route.pushNamed(context, routeName.chairData);
    notifyListeners();
  }

//ready for load to data
  void onReady() {
    newArrivalList = appArray.newArrival;
    newTrendFurniture = appArray.trendFurniture;
    newOfferZone = appArray.offerZone;
    newFurnitureDecor = appArray.furnitureDecor;
    newFurnitureType = appArray.furnitureType;
    notifyListeners();
  }

//add to cart Functionality
  void moveToCart(int index, List<Map<String, dynamic>> itemList, context) {
    if (index >= 0 && index < itemList.length) {
      Map<String, dynamic>? itemToMove = itemList[index];
      if (itemToMove['image'] != null &&
          itemToMove['title'] != null &&
          itemToMove["qty"] != null &&
          itemToMove["colorName"] != null &&
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
      }
      route.pushNamed(context, routeName.cartView);
      notifyListeners();
    }
  }

  //wishlist Functionality
  void moveToWishlist(int index, List<Map<String, dynamic>> itemList, context) {
    if (index >= 0 && index < itemList.length) {
      Map<String, dynamic>? itemToMove = itemList[index];
      if (itemToMove['image'] != null &&
          itemToMove['title'] != null &&
          itemToMove['finalAmount'] != null &&
          itemToMove['qty'] != null &&
          itemToMove["colorName"] != null &&
          itemToMove['amount'] != null) {
        String itemTitle = itemToMove['title'].toString();
        String itemAmount = itemToMove['finalAmount'].toString();
        String itemDiscount = itemToMove['amount'].toString();
        String itemColorName = itemToMove['colorName'].toString();

        int existingIndex = wishListHome.indexWhere((item) =>
            item['title'] == itemTitle &&
            item['finalAmount'] == itemAmount &&
            item['amount'] == itemDiscount &&
            item['colorName'] == itemColorName);

        if (existingIndex != -1) {
          bool alreadyInWishlist = itemList[index]['isInWishlist'] ?? false;
          if (!alreadyInWishlist) {
            itemList[index]['isInWishlist'] = true;
          }
          wishListHome[existingIndex]['qty'] += itemToMove['qty'];
        } else {
          wishListHome.add({
            "image": itemToMove['image'],
            "title": itemTitle,
            "qty": itemToMove['qty'],
            "finalAmount": itemAmount,
            "amount": itemDiscount,
            "colorName": itemColorName
          });
          itemList[index]['isInWishlist'] = true;
        }
        route.pushNamed(context, routeName.wishlist);
        notifyListeners();
      }
    }
  }
}
