import 'package:fuzzy/plugin_list.dart';
import '../../../../config.dart';

class ProfileSettingButtonLayout extends StatelessWidget {
  const ProfileSettingButtonLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, theme, child) {
      return Stack(children: [
        Container(
            height: Sizes.s73,
            width: MediaQuery.of(context).size.width,
            //button decoration
            decoration: ProfileWidget().buttonBottomDecor(context),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonCommon(
                      title: language(context, appFonts.cancle),
                      width: Sizes.s157,
                      height: Sizes.s48,
                      color: isTheme(context)
                          ? appColor(context).appTheme.transparentColor
                          : appColor(context).appTheme.searchBackground,
                      style: appCss.dmPoppinsRegular16
                          .textColor(appColor(context).appTheme.lightText),
                      radius: AppRadius.r10,
                      onTap: () => route.pop(context)),
                  ButtonCommon(
                      title: language(context, appFonts.save),
                      width: Sizes.s157,
                      height: Sizes.s48,
                      color: isThemeButtonColorReturn(context),
                      style: appCss.dmPoppinsRegular16.textColor(
                          isTheme(context)
                              ? appColor(context).appTheme.primaryColor
                              : appColor(context).appTheme.whiteColor),
                      radius: AppRadius.r10,
                      onTap: () => route.pop(context))
                ]).paddingAll(Insets.i10))
      ]);
    });
  }
}
