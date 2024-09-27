import 'package:fuzzy/config.dart';


class OnBoardingProvider with ChangeNotifier {
  final PageController pageController = PageController(initialPage: 0);
  AnimationController? controller;
  int currentPage = 0;

  //cricle rotation animation
  onRotateCircle(TickerProvider sync, context) {
    controller = AnimationController(
      vsync: sync,
      duration: const Duration(seconds: 4),
    )..repeat();
    controller!.repeat(reverse: false);
    notifyListeners();
  }

  //dispose animation
  onDispose() {
    controller!.dispose();
    controller!.notifyListeners();
  }

  //current page check
  pageChanged(int index) {
    currentPage = index;
    notifyListeners();
  }

// button click to next page event
  bottomTapped(int index, BuildContext context) {
    currentPage < 2 ? currentPage++ : route.pushNamed(context, routeName.login);
    pageController.animateToPage(
      currentPage,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
    notifyListeners();
  }
}
