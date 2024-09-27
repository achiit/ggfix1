import 'package:fuzzy/plugin_list.dart';
import '../../../../config.dart';

class ShippingOptionSubLayout extends StatelessWidget {
  final dynamic data;
  final int? index, selectIndex;
  final GestureTapCallback? onTap;

  const ShippingOptionSubLayout(
      {super.key, this.data, this.index, this.selectIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, theme, child) {
      return Container(
              width: MediaQuery.of(context).size.width,
              //decoration
              decoration: ShippingWidget().shippingOptionDecor(context),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //shipping option in icon display svg container
                    ShippingWidget().shippingOptionContainer(context, data),
                    const HSpace(Sizes.s8),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //text layout
                          Text(language(context, data["title"]),
                              overflow: TextOverflow.ellipsis,
                              style: appCss.dmPoppinsMedium14
                                  .textColor(isThemeColorReturn(context))),
                          const VSpace(Sizes.s5),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            //text layout
                            child: Text(language(context, data["description"]),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                style: appCss.dmPoppinsRegular12
                                    .textColor(isThemeColorReturn(context))),
                          )
                        ]).paddingSymmetric(vertical: Insets.i15),
                    //text layout
                    Text(
                        language(context,
                            '${getSymbol(context)}${(currency(context).currencyVal * double.parse(language(context, data["price"]))).toStringAsFixed(1)}'),
                        overflow: TextOverflow.ellipsis,
                        style: appCss.dmPoppinsMedium14
                            .textColor(isThemeColorReturn(context))),
                    //radio button
                    CommonRadio(
                            onTap: onTap,
                            index: index,
                            selectedIndex: selectIndex)
                        .paddingOnly(left: Insets.i5, right: Insets.i3)
                  ]).paddingSymmetric(horizontal: Insets.i8))
          .paddingOnly(bottom: Insets.i15);
    });
  }
}
