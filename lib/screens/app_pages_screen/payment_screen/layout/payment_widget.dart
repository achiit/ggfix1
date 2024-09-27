import '../../../../config.dart';

class PaymentWidget {
  //payment decor
  BoxDecoration paymentDecor(context) =>
      BoxDecoration(color: isThemeColorReturnDark(context), boxShadow: [
        BoxShadow(
            color: appColor(context).appTheme.shadowColorTwo,
            spreadRadius: 1,
            blurRadius: 6)
      ]);

//text link add new card
  Row textLinkLayout(context) =>
      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Text(language(context, appFonts.plus),
            style: appCss.dmPoppinsMedium12
                .textColor(isThemeColorReturn(context))),
        Text(language(context, appFonts.addCard),
            style: appCss.dmPoppinsMedium12
                .copyWith(decoration: TextDecoration.underline)
                .textColor(isThemeColorReturn(context)))
      ]);

//payment decor
  BoxDecoration decoPayment(context) => BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.r10),
          border: Border.all(
              width: Sizes.s1,
              color: appColor(context).appTheme.primaryColor.withOpacity(0.07)),
          color: isTheme(context)
              ? appColor(context).appTheme.colorContainer
              : appColor(context).appTheme.whiteColor,
          boxShadow: [
            BoxShadow(
                color: appColor(context).appTheme.shadowColorThree,
                spreadRadius: 2,
                blurRadius: 8)
          ]);

  //alert decor
  BoxDecoration decorAlertDialog(context) => BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r18)),
        color: appColor(context).appTheme.backGroundColorMain,
      );

//gif image
  SizedBox alertGif(context) => SizedBox(
      width: Sizes.s195,
      child: Image.asset(
          isTheme(context) ? gifAssets.gifSuccessDark : gifAssets.gifSuccess,
          height: Sizes.s150));

//alert Description
  Text alertDescription(context) =>
      Text(language(context, appFonts.alertDescription),
          style: appCss.dmPoppinsRegular14
              .textColor(appColor(context).appTheme.lightText),
          textAlign: TextAlign.center);
}
