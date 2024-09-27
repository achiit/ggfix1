import 'package:fuzzy/plugin_list.dart';
import '../../../../config.dart';

class ProfileSettingSubLayout extends StatelessWidget {
  const ProfileSettingSubLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, theme, child) {
      return Column(children: [
        //text layout
        ProfileWidget().textLayout(language(context, appFonts.name), context),
        const VSpace(Sizes.s6),
        //text filed
        SearchTextFieldCommon(
          hintStyle: appCss.dmPoppinsRegular13
              .textColor(appColor(context).appTheme.lightText),
          prefixIcon: ProfileWidget().svgImage(context, svgAssets.iconProfile),
          hintText: language(context, appFonts.profileName),
          keyboardType: TextInputType.text,
          //controller: ,
          // focusNode: ,
          //validator: ,
        ),
        const VSpace(Sizes.s15),
        //text layout
        ProfileWidget().textLayout(language(context, appFonts.email), context),
        const VSpace(Sizes.s6),
        //text filed
        SearchTextFieldCommon(
          hintStyle: appCss.dmPoppinsRegular13
              .textColor(appColor(context).appTheme.lightText),
          prefixIcon: ProfileWidget().svgImage(context, svgAssets.iconEmail),
          hintText: language(context, appFonts.hintEmailProfile),
          keyboardType: TextInputType.text,
          //controller: ,
          // focusNode: ,
          //validator: ,
        ),
        const VSpace(Sizes.s15),
        //text layout
        ProfileWidget().textLayout(
            language(context, appFonts.phoneNumberProfile), context),
        const VSpace(Sizes.s6),
        //text filed
        SearchTextFieldCommon(
          hintStyle: appCss.dmPoppinsRegular13
              .textColor(appColor(context).appTheme.lightText),
          prefixIcon: ProfileWidget().svgImage(context, svgAssets.iconPhone),
          hintText: language(context, appFonts.hintProfilePhoneNumber),
          keyboardType: TextInputType.text,
          //controller: ,
          // focusNode: ,
          //validator: ,
        )
      ]).paddingSymmetric(horizontal: Insets.i20);
    });
  }
}
