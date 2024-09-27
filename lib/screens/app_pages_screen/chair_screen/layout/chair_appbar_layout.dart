import 'package:fuzzy/config.dart';
import 'package:fuzzy/plugin_list.dart';

class ChairAppbarLayout extends StatelessWidget {
  const ChairAppbarLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<CategoryProvider, ThemeService>(
        builder: (context1, category, theme, child) {
      return Column(children: [
        Stack(children: [
          //appbar
          CommonAppBar(
              isIcon: true,
              appName: language(context, appFonts.chairs),
              onPressed: () => route.pop(context)),
          //alignment set
          CommonWidget().topAlign(
              context,
              //notification button on appbar
              CommonAppbarButton(
                  imagePath: isTheme(context)
                      ? svgAssets.iconTopNotificationWhite
                      : svgAssets.iconTopNotification,
                  onPressed: () =>
                      route.pushNamed(context, routeName.notification)))
        ])
            .paddingSymmetric(horizontal: Insets.i20)
            .paddingOnly(top: Insets.i10),
        //Filter layout
        CommonWidget()
            .filterLayout(category.searchCtrl, context)
            .paddingSymmetric(horizontal: Insets.i20, vertical: Insets.i25)
      ]);
    });
  }
}
