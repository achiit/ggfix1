import '../../config.dart';

class CategoryProvider with ChangeNotifier {
  TextEditingController searchCtrl = TextEditingController();
  List cartListData = [];
  List chairList = [];
  bool isBack = false;

  //page load
  void onReady(context) {
    chairList = appArray.chairlist;
    notifyListeners();
    dynamic data = ModalRoute.of(context)!.settings.arguments;
    isBack = data ?? false;
  }

  //move to cart
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

//device on back press
  onBackPress(context, isBack) async {
    if (isBack) {
      Navigator.canPop(context);
    } else {
      isDashboard(context);
    }
  }
}
