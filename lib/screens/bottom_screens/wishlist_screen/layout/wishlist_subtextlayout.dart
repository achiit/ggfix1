import 'package:fuzzy/plugin_list.dart';
import '../../../../config.dart';

class WishlistTextSubLayout extends StatelessWidget {
  final int index;
  final dynamic data;

  const WishlistTextSubLayout({super.key, required this.index, this.data});

  @override
  Widget build(BuildContext context) {
    return Consumer2<WishlistProvider, ThemeService>(
        builder: (context1, wishlist, theme, child) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //text layout
        Text(
          language(context, data['title'].toString()),
          style: appCss.dmPoppinsMedium14.textColor(isThemeColorReturn(context)),
          overflow: TextOverflow.ellipsis,
        ).paddingOnly(bottom: Insets.i4),
        Row(children: [
          //text layout
          Text(language(context, appFonts.qty),
              style: appCss.dmPoppinsRegular12.textColor(isTheme(context)
                  ? appColor(context).appTheme.whiteColor.withOpacity(0.40)
                  : appColor(context).appTheme.primaryColor.withOpacity(0.40))),
          Text(language(context, data["qty"].toString()),
              style: appCss.dmPoppinsRegular12.textColor(isTheme(context)
                  ? appColor(context).appTheme.whiteColor.withOpacity(0.40)
                  : appColor(context).appTheme.primaryColor.withOpacity(0.40)))
        ]),
        Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
          //text layout
          Text(
              language(context,
                  '${getSymbol(context)}${(currency(context).currencyVal * double.parse(language(context, data['finalAmount'].toString()))).toStringAsFixed(1)}'),
              overflow: TextOverflow.ellipsis,
              style: appCss.dmPoppinsSemiBold15
                  .textColor(isThemeColorReturn(context))),
          const HSpace(Sizes.s5),
          Text(
              language(context,
                  '${getSymbol(context)}${(currency(context).currencyVal * double.parse(language(context, data['amount'].toString()))).toStringAsFixed(1)}'),
              overflow: TextOverflow.ellipsis,
              style: appCss.dmPoppinsMedium12
                  .textColor(appColor(context).appTheme.subtextColor)
                  .textDecoration(TextDecoration.lineThrough,
                      color: appColor(context).appTheme.lightText,
                      thickness: Sizes.s2))
        ]).paddingOnly(top: Insets.i10)
      ]);
    });
  }
}
