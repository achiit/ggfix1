import 'package:fuzzy/plugin_list.dart';
import '../../../../config.dart';

class EmptyNotification extends StatelessWidget {
  const EmptyNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context1, theme, child) {
      //direction layout
      return DirectionLayout(
        dChild: Scaffold(
            backgroundColor: appColor(context).appTheme.backGroundColorMain,
            body: SafeArea(
                //empty layout for notification
                child: CommonEmptyPage(
                    height: Sizes.s180,
                    appName: language(context, appFonts.notification),
                    imagePath: isTheme(context)
                        ? gifAssets.gifNotificationDark
                        : gifAssets.gifEmptyNotification,
                    text: language(context, appFonts.emptyNotificationTitle),
                    textDescription: language(
                        context, appFonts.emptyNotificationDescription),
                    btnTitle: language(context, appFonts.refresh),
                    onTap: () => route.pop(context)))),
      );
    });
  }
}
