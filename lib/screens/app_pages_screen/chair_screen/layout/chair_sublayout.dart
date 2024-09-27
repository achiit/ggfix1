import 'package:fuzzy/plugin_list.dart';
import '../../../../config.dart';

class ChairSubLayout extends StatelessWidget {
  final int index;
  final dynamic data;

  const ChairSubLayout({super.key, required this.index, this.data});

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(builder: (context, category, child) {
      return Stack(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          VSpace(MediaQuery.of(context).size.height * 0.215),
          //text layout
          Text(language(context, data['title'].toString()),
              overflow: TextOverflow.ellipsis,
              style: appCss.dmPoppinsMedium14
                  .textColor(isThemeColorReturn(context))),
          //text layout
          Text(language(context, data['description'].toString()),
              style: appCss.dmPoppinsRegular12
                  .textColor(appColor(context).appTheme.lightText)),
          const VSpace(Sizes.s10),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  //text layout
                  Text(
                      language(context,
                          '${getSymbol(context)}${(currency(context).currencyVal * double.parse(language(context, data['finalAmount'].toString()))).toStringAsFixed(1)}'),
                      overflow: TextOverflow.ellipsis,
                      style: appCss.dmPoppinsSemiBold14
                          .textColor(isThemeColorReturn(context))),
                  //text layout
                  Text(
                      language(context,
                          '${getSymbol(context)}${(currency(context).currencyVal * double.parse(language(context, data['amount'].toString()))).toStringAsFixed(1)}'),
                      overflow: TextOverflow.ellipsis,
                      style: appCss.dmPoppinsRegular11
                          .textColor(appColor(context).appTheme.lightText)
                          .textDecoration(TextDecoration.lineThrough,
                              color: appColor(context).appTheme.lightText,
                              thickness: Sizes.s2))
                ]),
                Row(children: [
                  //svg image
                  SvgPicture.asset(svgAssets.iconStar),
                  const HSpace(Sizes.s1),
                  //text layout
                  Text(language(context, data['rating'].toString()),
                      style: appCss.dmPoppinsRegular12
                          .textColor(isThemeColorReturn(context)))
                ])
              ]).paddingOnly(bottom: Insets.i8)
        ]).paddingSymmetric(horizontal: Insets.i10)
      ]);
    });
  }
}
