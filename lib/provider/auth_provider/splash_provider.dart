import '../../config.dart';

class SplashProvider with ChangeNotifier {
  AnimationController? controller;
  Animation<double>? sizeAnimation;

  //dispose call
  onDispose() {
    controller!.dispose();
    notifyListeners();
  }

  //splash animation
  onAnimate(TickerProvider sync, context) {
    controller =
        AnimationController(vsync: sync, duration: const Duration(seconds: 2));
    sizeAnimation = Tween<double>(begin: 150.0, end: 200.0).animate(
      CurvedAnimation(parent: controller!, curve: const Interval(0.7, 1)),
    );
    controller!.forward().whenComplete(() {
      route.pushNamed(context, routeName.onBoarding);
    });
    notifyListeners();
  }
}
