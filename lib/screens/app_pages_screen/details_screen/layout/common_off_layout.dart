import 'package:fuzzy/plugin_list.dart';
import '../../../../config.dart';

class CommonOffLayout extends StatelessWidget {
  const CommonOffLayout({super.key});

  @override
  Widget build(BuildContext context) {
    //top align set
    return CommonWidget().topAlign(
      context,
      Stack(children: [
        //svg image direction wise
        SvgPicture.asset(
            isDirectionRTL(context) || isAr(context)
                ? svgAssets.iconOfferRTL
                : svgAssets.iconOfferDetails,
            colorFilter: ColorFilter.mode(
                appColor(context).appTheme.linkErrorColor, BlendMode.srcIn)),
        Column(children: [
          //offer text layout
          Text(
                  language(context, appFonts.offerDiscount) +
                      language(context, appFonts.offerText),
                  style: appCss.dmPoppinsSemiBold12
                      .textColor(appColor(context).appTheme.linkErrorColor))
              .paddingSymmetric(horizontal: Insets.i5),
        ]).paddingAll(Insets.i5)
      ]),
    );
  }
}
