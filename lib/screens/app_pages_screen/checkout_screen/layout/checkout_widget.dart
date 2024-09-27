import '../../../../config.dart';

class CheckOutWidget {
  //box decoration
  BoxDecoration decor(context) => BoxDecoration(
      borderRadius: BorderRadius.circular(AppRadius.r10),
      border: Border.all(
          width: Sizes.s1,
          color: appColor(context).appTheme.primaryColor.withOpacity(0.07)),
      color: appColor(context).appTheme.colorContainer);

  //box decoration
  BoxDecoration onlyDecor(context, color, isDark) => BoxDecoration(
      borderRadius: BorderRadius.circular(AppRadius.r10),
      color: color ??
          (isDark
              ? appColor(context).appTheme.colorContainer
              : appColor(context).appTheme.searchBackground));

  //box decoration
  BoxDecoration decorWithShadow(context) => BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.r10),
          border: Border.all(
              width: Sizes.s1,
              color: appColor(context).appTheme.primaryColor.withOpacity(0.07)),
          color: appColor(context).appTheme.colorContainer,
          boxShadow: [
            BoxShadow(
                color: appColor(context).appTheme.shadowColorThree,
                spreadRadius: 2,
                blurRadius: 8)
          ]);

//common divider
  SizedBox divider(context, isDark) => SizedBox(
      height: Sizes.s25,
      child: VerticalDivider(
          color: isDark
              ? appColor(context).appTheme.whiteColor.withOpacity(0.34)
              : appColor(context).appTheme.shadowColor,
          width: Sizes.s2));

//main title text
  Align mainAllText(context, {required String mainText}) => Align(
      alignment: isDirectionRTL(context) || isAr(context)
          ? Alignment.topRight
          : Alignment.topLeft,
      child: Text(mainText,
          style: appCss.dmPoppinsSemiBold15
              .textColor(isThemeColorReturn(context))));

// order info text
  Row textDisplay(context,
          {required String mainText, required String subText}) =>
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(mainText,
            style: appCss.dmPoppinsRegular13
                .textColor(appColor(context).appTheme.lightText)),
        Text(subText,
            overflow: TextOverflow.ellipsis,
            style: appCss.dmPoppinsRegular13
                .textColor(isThemeColorReturn(context)))
      ]);

  //promo code decor
  BoxDecoration promoDecor(context) => BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.r10),
        color: isTheme(context)
            ? appColor(context).appTheme.colorContainer
            : appColor(context).appTheme.searchBackground,
      );
}
