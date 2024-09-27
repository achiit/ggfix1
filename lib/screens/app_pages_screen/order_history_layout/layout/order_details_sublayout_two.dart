import '../../../../config.dart';

class OrderDetailsSubLayoutTwo extends StatelessWidget {
  const OrderDetailsSubLayoutTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //decoration
      padding: const EdgeInsets.symmetric(horizontal: Insets.i15),
      decoration: CommonWidget().decor(context),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(language(context, appFonts.shippingDetails),
                style: appCss.dmPoppinsMedium14
                    .textColor(isThemeColorReturn(context)))
            .paddingOnly(top: Insets.i15),
        //divider
        CommonWidget().commonDivider(context).paddingSymmetric(vertical: Insets.i10),
        Text(language(context, appFonts.address),
            style: appCss.dmPoppinsRegular12
                .textColor(isThemeColorReturn(context))),
        const VSpace(Sizes.s1),
        Text(language(context, appFonts.orderDetailsAddress),
            style: appCss.dmPoppinsRegular12
                .textColor(appColor(context).appTheme.lightText)),
        const VSpace(Sizes.s10),
        Row(children: [
          Text(language(context, appFonts.phone),
              style: appCss.dmPoppinsRegular12
                  .textColor(isThemeColorReturn(context))),
          const HSpace(Sizes.s8),
          Text(language(context, appFonts.pNumber),
              style: appCss.dmPoppinsRegular12
                  .textColor(appColor(context).appTheme.lightText))
        ]).paddingOnly(bottom: Insets.i15)
      ]),
    );
  }
}
