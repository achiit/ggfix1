import '../../../config.dart';
import 'package:fuzzy/plugin_list.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Consumer<SplashProvider>(builder: (context1, splash, child) {
      //page load
      return StatefulWrapper(
          onInit: () => Future.delayed(const Duration(milliseconds: 10),
              () => splash.onAnimate(this, context)),
          child: Scaffold(
              backgroundColor: appColor(context).appTheme.primaryColor,
              body: SafeArea(
                  child: Center(
                      child: splash.controller != null &&
                              splash.sizeAnimation != null
                          //animation
                          ? AnimatedBuilder(
                              animation: splash.controller!,
                              builder: (context, child) {
                                return SizedBox(
                                    height: splash.sizeAnimation!.value,
                                    width: splash.sizeAnimation!.value,
                                    child: Image.asset(imageAssets.splashBg));
                              })
                          : const CircularProgressIndicator() // Placeholder or loading indicator
                      ))));
    });
  }
}
