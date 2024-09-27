import '../../../../config.dart';

class OrderSubLayout extends StatelessWidget {
  final Color? color;

  const OrderSubLayout({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(Insets.i15),
        decoration:
            //decoration
            CheckOutWidget().onlyDecor(context, color, isTheme(context)),
        child: Column(children: [
          //layout design for order info
          CheckOutWidget().textDisplay(context,
              mainText: language(context, appFonts.subTotal),
              subText: language(context,
                  '${getSymbol(context)}${(currency(context).currencyVal * double.parse(language(context, appFonts.totalAmount))).toStringAsFixed(1)}')),
          const VSpace(Sizes.s15),
          //layout design for order info
          CheckOutWidget().textDisplay(context,
              mainText: language(context, appFonts.shippingCharges),
              subText: language(context,
                  '${getSymbol(context)}${(currency(context).currencyVal * double.parse(language(context, appFonts.amount))).toStringAsFixed(1)}')),
          const VSpace(Sizes.s15),
          //layout design for order info
          CheckOutWidget().textDisplay(context,
              mainText: language(context, appFonts.discount),
              subText: language(context,
                  '${getSymbol(context)}${(currency(context).currencyVal * double.parse(language(context, appFonts.discountAmount))).toStringAsFixed(1)}')),
          const VSpace(Sizes.s15),
          Divider(
              height: Sizes.s1, color: appColor(context).appTheme.lightText),
          const VSpace(Sizes.s15),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(language(context, appFonts.amountDisplay),
                style: appCss.dmPoppinsRegular13
                    .textColor(isThemeColorReturn(context))),
            Text(
                language(context,
                    '${getSymbol(context)}${(currency(context).currencyVal * double.parse(language(context, appFonts.totalAmountCheckout))).toStringAsFixed(1)}'),
                overflow: TextOverflow.ellipsis,
                style: appCss.dmPoppinsRegular13
                    .textColor(isThemeColorReturn(context)))
          ])
        ]));
  }
}
