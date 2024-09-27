import '../../../../config.dart';
import '../../../../plugin_list.dart';

class ProfileWidget {
  //decoration list
  BoxDecoration decor(context) => BoxDecoration(
      borderRadius: BorderRadius.circular(AppRadius.r8),
      color: appColor(context).appTheme.searchBackground);

//edit button decor
  BoxDecoration decorEdit(context) => BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.r6),
        color: appColor(context).appTheme.whiteColor,
      );

//top container profile setting
  Container topContainer(context) => Container(
      height: Sizes.s114,
      width: MediaQuery.of(context).size.width,
      color: appColor(context).appTheme.searchBackground,
      child: Column(children: [
        CommonAppBar(
            appName: language(context, appFonts.profileSetting),
            isIcon: true,
            margin:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.25),
            onPressed: () =>
                route.pop(context)).paddingOnly(
            left: Insets.i20,
            right: Insets.i20,
            top: Insets.i15,
            bottom: Insets.i20)
      ]));

//svg image in profile setting
  SvgPicture svgImage(context, image) => SvgPicture.asset(image,
      fit: BoxFit.scaleDown,
      colorFilter: ColorFilter.mode(
          isTheme(context)
              ? appColor(context).appTheme.whiteColor
              : appColor(context).appTheme.iconColor,
          BlendMode.srcIn));

//text layout profile setting
  Row textLayout(text, context) =>
      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Expanded(
            child: Text(text,
                style: appCss.dmPoppinsMedium14
                    .textColor(isThemeColorReturn(context))))
      ]);

//button border  decoration
  BoxDecoration buttonBottomDecor(context) => BoxDecoration(
          border: Border.all(
              width: Sizes.s1,
              color: appColor(context).appTheme.shadowWhiteColor),
          color: isThemeColorReturnDark(context),
          boxShadow: [
            BoxShadow(
                color: appColor(context).appTheme.shadowColorTwo,
                spreadRadius: 2,
                blurRadius: 8)
          ]);
}
