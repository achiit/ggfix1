import '../../../../config.dart';
import '../../../../plugin_list.dart';

class NewArrivalSubLayout extends StatelessWidget {
  final int? index;
  final dynamic data;

  const NewArrivalSubLayout({super.key, this.index, this.data});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context1, home, child) {
      return Stack(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          VSpace(MediaQuery.of(context).size.height * 0.21),
          //text layout
          Text(language(context, data['title'].toString()),
              style: appCss.dmPoppinsMedium14
                  .textColor(isThemeColorReturn(context))),
          const VSpace(Sizes.s1), //text layout
          Text(language(context, data['description'].toString()),
              style: appCss.dmPoppinsRegular12
                  .textColor(appColor(context).appTheme.lightText)),
          const VSpace(Sizes.s10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(children: [
              //text layout
              Text(
                  language(context,
                      '${getSymbol(context)}${(currency(context).currencyVal * double.parse(language(context, data['finalAmount'].toString()))).toStringAsFixed(1)}'),
                  overflow: TextOverflow.ellipsis,
                  style: appCss.dmPoppinsSemiBold15
                      .textColor(isThemeColorReturn(context))),
              data['amount'] != null
                  ? Text(
                      language(context,
                          '${getSymbol(context)}${(currency(context).currencyVal * double.parse(language(context, data['amount'].toString()))).toStringAsFixed(1)}'),
                      overflow: TextOverflow.ellipsis,
                      style: appCss.dmPoppinsRegular12
                          .textColor(appColor(context).appTheme.lightText)
                          .textDecoration(TextDecoration.lineThrough,
                              color: appColor(context).appTheme.lightText,
                              thickness: Sizes.s2))
                  : const Text(""),
            ]),
            Row(children: [
              //svg icon
              SvgPicture.asset(svgAssets.iconStar),
              Text(language(context, data['rating'].toString()),
                  style: appCss.dmPoppinsRegular12
                      .textColor(isThemeColorReturn(context)))
            ])
          ])
        ]).paddingSymmetric(horizontal: Insets.i8)
      ]);
    });
  }
}
