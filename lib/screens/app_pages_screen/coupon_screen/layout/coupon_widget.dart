import 'dart:math';
import '../../../../config.dart';

class CouponWidget {
  //divider
  SizedBox divider(context) => SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Divider(
          height: Sizes.s1,
          color: isTheme(context)
              ? appColor(context).appTheme.transparentColor
              : appColor(context).appTheme.shadowColor));

  //text title and description display
  Row textDescription(context, data) => Row(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(language(context, data['offerMode']),
                style: appCss.dmPoppinsMedium14
                    .textColor(isThemeColorReturn(context))),
            const VSpace(Sizes.s5),
            Text(language(context, data['offerDescription']),
                style: appCss.dmPoppinsRegular12
                    .textColor(appColor(context).appTheme.lightText),
                maxLines: 2,
                overflow: TextOverflow.visible),
          ]),
        ],
      );

  //offer % text
  Widget offerText(context, data) => Transform.rotate(
          angle: -pi / Sizes.s2,
          child: Text(language(context, data['offer']),
              style: appCss.dmPoppinsSemiBold23
                  .textColor(appColor(context).appTheme.btnPrimaryColor)))
      .paddingOnly(
          top: Insets.i60, right: MediaQuery.of(context).size.width * 0.02);

  //off text
  Widget off(context, data) => Transform.rotate(
      angle: -pi / Sizes.s2, // Rotate the text
      child: Text(language(context, data['off']),
          style: appCss.dmPoppinsRegular13
              .textColor(appColor(context).appTheme.whiteColor)));

  //apply and coupon code
  Row codeApply(context, data) =>
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(language(context, data['offerCode']),
            style: appCss.dmPoppinsRegular12
                .textColor(appColor(context).appTheme.lightText)),
        Text(language(context, appFonts.apply),
                style: appCss.dmPoppinsMedium12
                    .textColor(isThemeColorReturn(context)))
            .inkWell(onTap: () => route.pop(context, arg: data['offerCode']))
      ]);
//image display
  Image image(context) => Image.asset(
      isTheme(context)
          ? imageAssets.imageDarkBannerCoupon
          : imageAssets.imageCouponCodeSecond,
      fit: BoxFit.cover // Adjust the fit as needed
      );
}
