import '../../../../config.dart';

class OrderHistorySubLayoutOne extends StatelessWidget {
  final dynamic data;

  const OrderHistorySubLayoutOne({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Row(children: [
        Container(
            height: Sizes.s68,
            width: Sizes.s69,
            padding: const EdgeInsets.all(Insets.i10),
            margin: const EdgeInsets.all(Insets.i12),
            //decoration
            decoration: OrderWidget().deco(context),
            child: Image.asset(data['image'])),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(language(context, data['title']),
              style: appCss.dmPoppinsMedium14
                  .textColor(isThemeColorReturn(context))),
          const VSpace(Sizes.s1),
          Row(children: [
            Text(language(context, appFonts.qty),
                style: appCss.dmPoppinsRegular12
                    .textColor(appColor(context).appTheme.lightText)),
            Text(language(context, data['qty'].toString()),
                style: appCss.dmPoppinsRegular12
                    .textColor(appColor(context).appTheme.lightText))
          ]),
          const VSpace(Sizes.s10),
          Text(language(context, data['status']),
              style: data['status'] == appFonts.viewDetails
                  ? appCss.dmPoppinsRegular12
                      .textColor(appColor(context).appTheme.linkErrorColor)
                  : appCss.dmPoppinsRegular12
                      .textColor(appColor(context).appTheme.lightText))
        ])
      ]),
      //align set
      CommonWidget().topAlign(
          context,
          Container(
              //decoration
              decoration: OrderWidget().decorContainer(context, data),
              padding: const EdgeInsets.symmetric(
                  horizontal: Insets.i8, vertical: Insets.i3),
              margin: const EdgeInsets.only(
                  right: Insets.i12, top: Insets.i12, left: Insets.i12),
              child: Text(language(context, data['deliveryStatus']),
                  style: data['deliveryStatus'] == appFonts.onGoing
                      ? appCss.dmPoppinsRegular12
                          .textColor(appColor(context).appTheme.highLight)
                      : appCss.dmPoppinsRegular12
                          .textColor(appColor(context).appTheme.highLightRed))))
    ]);
  }
}
