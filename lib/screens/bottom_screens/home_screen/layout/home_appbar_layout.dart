import 'package:fuzzy/config.dart';
import 'package:fuzzy/plugin_list.dart';

class HomeAppBarLayout extends StatelessWidget {
  const HomeAppBarLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer3<HomeProvider, ThemeService, DashboardProvider>(
        builder: (context1, home, theme, dashboard, child) {
      //direction layout
      return DirectionLayout(
          dChild: Container(
              height: Sizes.s42,
              color: appColor(context).appTheme.backGroundColorMain,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      //menu button click event
                      CommonAppbarButton(
                          color: CommonWidget().colorFilter(context),
                          imagePath: svgAssets.iconMenu,
                          onPressed: () =>
                              dashboard.scaffoldKey.currentState!.openDrawer()),
                      const HSpace(Sizes.s12),
                      Container(
                        height: Sizes.s40,
                        width: Sizes.s40,
                        //profile image decor
                        decoration: HomeWidget().decor(imageAssets.profile),
                      ),
                      const HSpace(Sizes.s10),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(language(context, appFonts.hello),
                                style: appCss.dmPoppinsMedium12.textColor(
                                    isTheme(context)
                                        ? appColor(context)
                                            .appTheme
                                            .whiteColor
                                            .withOpacity(0.34)
                                        : appColor(context)
                                            .appTheme
                                            .primaryColor
                                            .withOpacity(0.34))),
                            Text(language(context, appFonts.nameAgasya),
                                style: appCss.dmPoppinsMedium16
                                    .textColor(isThemeColorReturn(context)))
                          ])
                    ]),
                    //notification click event
                    CommonAppbarButton(
                        imagePath: isTheme(context)
                            ? svgAssets.iconTopNotificationWhite
                            : svgAssets.iconTopNotification,
                        onPressed: () =>
                            route.pushNamed(context, routeName.notification))
                  ])));
    });
  }
}
