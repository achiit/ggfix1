import 'package:fuzzy/plugin_list.dart';
import '../../../config.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer3<DashboardProvider, ThemeService, ProfileProvider>(
        builder: (context1, dashboard, theme, profile, child) {
      return StatefulWrapper(
          onInit: () => Future.delayed(const Duration(milliseconds: 50))
              .then((_) => profile.onReady(context)),
          child: PopScope(
              canPop: true,
              onPopInvoked: (canPop) =>
                  profile.onDeviceBack(context, profile.isBack),
              child: DirectionLayout(
                dChild: Scaffold(
                    backgroundColor:
                        appColor(context).appTheme.backGroundColorMain,
                    body: SafeArea(
                        child: Stack(children: [
                      const ProfileAppbarLayout(),
                      Row(children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.075),
                          height: Sizes.s90,
                          width: Sizes.s90,
                          child: Image.asset(imageAssets.imageProfilePic,
                              fit: BoxFit.fill),
                        ).paddingSymmetric(
                            vertical: Insets.i5, horizontal: Insets.i20)
                      ]),
                      Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.107),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(language(context, appFonts.profileName),
                                        style: appCss.dmPoppinsMedium15
                                            .textColor(
                                                isThemeColorReturn(context)))
                                    .paddingSymmetric(horizontal: Insets.i90),
                                //edit button and click event
                                CommonEditButton(
                                    imagePath: svgAssets.iconEdit,
                                    onPressed: () => route.pushNamed(
                                        context, routeName.profileSetting))
                              ]).paddingSymmetric(horizontal: Insets.i20))
                    ]))),
              )));
    });
  }
}
