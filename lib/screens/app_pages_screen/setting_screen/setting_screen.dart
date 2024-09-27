import 'package:fuzzy/plugin_list.dart';
import '../../../config.dart';

class SettingLayout extends StatelessWidget {
  const SettingLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, theme, child) {
      //direction layout
      return DirectionLayout(
          dChild: Scaffold(
              backgroundColor: appColor(context).appTheme.backGroundColorMain,
              body: SafeArea(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          //appbar for setting page
                          CommonAppBar(
                                  appName: language(context, appFonts.setting),
                                  isIcon: true,
                                  onPressed: () => route.pop(context))
                              .paddingSymmetric(
                                  horizontal: Insets.i20, vertical: Insets.i10),
                          //setting list layout
                          const SettingLayoutOne(),
                        ]))
                  ]))));
    });
  }
}
