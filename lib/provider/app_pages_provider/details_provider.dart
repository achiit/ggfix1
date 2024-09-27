import 'package:fuzzy/config.dart';
import 'package:fuzzy/plugin_list.dart';

class DetailsProvider with ChangeNotifier {
  bool isDimensions = true;
  bool isCheckDelivery = true;
  bool isDetails = true;
  bool isDisableCenter = false;
  bool isReviews = true;
  CarouselController carouselController = CarouselController();
  int currentPage = 0;
  double currentValue = 0;
  bool isCurrentActive = false;
  bool isWishlist = false;
  int qty = 1;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController reviewController = TextEditingController();
  TextEditingController reviewsController = TextEditingController();
  final FocusNode reviewFocus = FocusNode();
  final FocusNode nameFocus = FocusNode();
  final FocusNode reviewsFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  bool isBack = false;

//load page
  onReady(context) {
    dynamic data = ModalRoute.of(context)!.settings.arguments;
    isBack = data ?? false;
  }

//details 1 dropdown click
  isClickDown(String value) {
    if (value == appFonts.dimensions) {
      isDimensions = !isDimensions;
    } else if (value == appFonts.checkDelivery) {
      isCheckDelivery = !isCheckDelivery;
    } else if (value == appFonts.details) {
      isDetails = !isDetails;
    } else if (value == appFonts.reviews) {
      isReviews = !isReviews;
    }
    notifyListeners();
  }

//details page increment
  void incrementProduct(currentitem) {
    qty = qty + 1;
    notifyListeners();
  }

//details page decrement
  void decrementProduct(currentItem) {
    if (qty > 1) {
      qty = qty - 1;
      notifyListeners();
    }
  }

//details 2 page change event
  onChange(int index) {
    currentPage = index;
    notifyListeners();
  }

//details 1 page change event
  onChangePage(int index) {
    currentPage = index;
    currentPage == 3 ? currentValue = 25 : currentValue += 25;
    notifyListeners();
  }

//details page wishlist in or not
  onWishlistIn() {
    isWishlist = !isWishlist;
    notifyListeners();
  }

  //details page write review layout
  void onShowBottomLayout(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Set to true to occupy full screen height
      builder: (BuildContext context) {
        return const WriteReviewLayout();
      },
    );
  }

  //OrderDetails click event
  onOrderDetails(context, isBack) {
    if (isBack) {
      route.pop(context);
    } else {
      isDashboard(context);
    }
  }

  //popScope click event
  detailsPopScope(details) {
    details.currentPage = 0;
    details.carouselController.jumpToPage(0);
    details.carouselController.jumpToPage(0);
    notifyListeners();
  }
}
