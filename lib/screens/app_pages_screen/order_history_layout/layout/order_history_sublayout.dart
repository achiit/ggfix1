import '../../../../config.dart';

class OrderHistorySubLayout extends StatelessWidget {
  final int index;
  final dynamic data;
  const OrderHistorySubLayout({super.key, required this.index, this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
            width: MediaQuery.of(context).size.width,
            decoration: OrderWidget().decorHistory(context),
            margin: const EdgeInsets.only(bottom: Insets.i15),
            padding: const EdgeInsets.only(bottom: Insets.i10),
            child: Column(children: [
              //order history text layout
              OrderHistorySubLayoutOne(data: data),
              //divider
        CommonWidget().commonDivider(context).paddingOnly(bottom: Insets.i10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(children: [
                  Text(language(context, appFonts.ordered),
                      style: appCss.dmPoppinsRegular12
                          .textColor(isThemeColorReturn(context))),
                  Text(language(context, data['orderDeliveryDate']),
                      style: appCss.dmPoppinsRegular12
                          .textColor(appColor(context).appTheme.lightText))
                ]),
                data['dispatch'] == ''
                    //svg image
                    ? CommonWidget().svgAssets(context, svgAssets.iconNextArrow)
                    : Text(language(context, data['dispatch']),
                        style: appCss.dmPoppinsRegular12
                            .textColor(appColor(context).appTheme.primaryColor))
              ]).paddingSymmetric(horizontal: Insets.i12),
              const VSpace(Sizes.s8),
              data['isMap'] == true
                  ? Container(
                      //decoration
                margin: const EdgeInsets.symmetric(horizontal: Insets.i12),
                      decoration: OrderWidget().decoBorder(),
                      height: Sizes.s43,
                      child: Image.asset(imageAssets.imageMap),
                    )
                  : Container()
            ]));
  }
}
