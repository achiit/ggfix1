import '../../../../config.dart';
import '../../../../plugin_list.dart';

class CartSubTextLayout extends StatelessWidget {
  final int index;
  final dynamic data;

  const CartSubTextLayout({super.key, required this.index, this.data});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context1, cart, child) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //text layout
        Text(language(context, data['title'].toString()),
                style: appCss.dmPoppinsMedium14
                    .textColor(isThemeColorReturn(context)),
                maxLines: 2,
                overflow: TextOverflow.visible)
            .paddingOnly(bottom: Insets.i6),
        //cart sub text layout
        CartSubTextRowLayout(data: data),
        Row(children: [
          //text layout
          Text(
              language(context,
                  '${getSymbol(context)}${(currency(context).currencyVal * double.parse(language(context, data['finalAmount'].toString()))).toStringAsFixed(1)}'),
              overflow: TextOverflow.ellipsis,
              style: appCss.dmPoppinsSemiBold14
                  .textColor(isThemeColorReturn(context))),
          const HSpace(Sizes.s2),
          //text layout
          Text(
            language(context,
                '${getSymbol(context)}${(currency(context).currencyVal * double.parse(language(context, data['amount'].toString()))).toStringAsFixed(1)}'),
            overflow: TextOverflow.ellipsis,
            style: appCss.dmPoppinsRegular11
                .textColor(appColor(context).appTheme.subtextColor)
                .textDecoration(TextDecoration.lineThrough,
                    color: appColor(context).appTheme.subtextColor,
                    thickness: Sizes.s2),
          )
        ]).paddingOnly(top: Insets.i25)
      ]);
    });
  }
}
