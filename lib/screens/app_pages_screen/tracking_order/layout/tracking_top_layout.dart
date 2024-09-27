import 'package:fuzzy/plugin_list.dart';
import '../../../../config.dart';

class TrackingTopLayout extends StatelessWidget {
  const TrackingTopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, theme, child) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //tracking date
        Text(language(context, appFonts.orderTrackingDate),
            style: appCss.dmPoppinsMedium14
                .textColor(appColor(context).appTheme.lightText)),
        const VSpace(Sizes.s7),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(children: [
            //order id
            Text(language(context, appFonts.orderId),
                style: appCss.dmPoppinsMedium14.textColor(isTheme(context)
                    ? appColor(context).appTheme.lightText
                    : appColor(context).appTheme.colorText)),
            //order number
            Text(language(context, appFonts.orderNo),
                style: appCss.dmPoppinsMedium14.textColor(isTheme(context)
                    ? appColor(context).appTheme.lightText
                    : appColor(context).appTheme.colorText))
          ]),
          Row(children: [
            //amount
            Text(language(context, appFonts.amountTrack),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: appCss.dmPoppinsRegular14.textColor(isTheme(context)
                    ? appColor(context).appTheme.lightText
                    : appColor(context).appTheme.colorText)),
            //amount
            Text(
                language(context,
                    '${getSymbol(context)}${(currency(context).currencyVal * double.parse(language(context, appFonts.amountTracing))).toStringAsFixed(1)}'),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: appCss.dmPoppinsSemiBold16.textColor(isTheme(context)
                    ? appColor(context).appTheme.lightText
                    : appColor(context).appTheme.colorText)),
          ])
        ]),
        const VSpace(Sizes.s20),
        //divider
        CommonWidget().commonDivider(context),
        const VSpace(Sizes.s25)
      ]);
    });
  }
}
