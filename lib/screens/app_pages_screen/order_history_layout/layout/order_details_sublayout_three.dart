import '../../../../config.dart';

class OrderDetailsSubLayoutThree extends StatelessWidget {
  const OrderDetailsSubLayoutThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        //container decoration
        decoration: CommonWidget().decor(context),
        child: Column(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Container(
                        height: Sizes.s50,
                        width: Sizes.s50,
                        padding: const EdgeInsets.all(Insets.i10),
                        margin: const EdgeInsets.symmetric(
                            vertical: Insets.i12, horizontal: Insets.i5),
                        //decoration
                        decoration: OrderWidget().deco(context),
                        child: Image.asset(imageAssets.imageChairSeven)),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(language(context, appFonts.chairName),
                              style: appCss.dmPoppinsMedium14
                                  .textColor(isThemeColorReturn(context))),
                          const VSpace(Sizes.s6),
                          Row(children: [
                            Text(language(context, appFonts.qty),
                                style: appCss.dmPoppinsRegular12.textColor(
                                    appColor(context).appTheme.lightText)),
                            const HSpace(Sizes.s1),
                            Text(language(context, appFonts.qtyOne),
                                style: appCss.dmPoppinsRegular12.textColor(
                                    appColor(context).appTheme.lightText))
                          ])
                        ])
                  ]),
                  Text(
                          language(context,
                              '${getSymbol(context)}${(currency(context).currencyVal * double.parse(language(context, appFonts.totalAmount))).toStringAsFixed(1)}'),
                          overflow: TextOverflow.ellipsis,
                          style: appCss.dmPoppinsRegular14
                              .textColor(isThemeColorReturn(context)))
                      .paddingOnly(top: Insets.i15)
                ]),
            //divider
            CommonWidget().commonDivider(context),
          ]).paddingOnly(
              left: Insets.i12, right: Insets.i12, bottom: Insets.i5),
          //order sub layout
          OrderSubLayout(color: appColor(context).appTheme.searchBackground)
        ]));
  }
}
