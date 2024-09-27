import 'package:fuzzy/plugin_list.dart';
import '../../../../config.dart';

class OrderDetailsSubLayoutOne extends StatelessWidget {
  const OrderDetailsSubLayoutOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, theme, child) {
      return Container(
          //container decoration
          decoration: CommonWidget().decor(context),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(children: [
                Text(language(context, appFonts.orderId),
                    style: appCss.dmPoppinsMedium14.textColor(isTheme(context)
                        ? appColor(context).appTheme.lightText
                        : appColor(context).appTheme.colorText)),
                const HSpace(Sizes.s1),
                Text(language(context, appFonts.orderNo),
                    style: appCss.dmPoppinsMedium14.textColor(isTheme(context)
                        ? appColor(context).appTheme.lightText
                        : appColor(context).appTheme.colorText))
              ]),
              Text(language(context, appFonts.completed),
                  style: appCss.dmPoppinsRegular12
                      .textColor(appColor(context).appTheme.highLight))
            ]).paddingOnly(
                left: Insets.i15,
                top: Insets.i15,
                bottom: Insets.i10,
                right: Insets.i15),
            Text(language(context, appFonts.date),
                    style: appCss.dmPoppinsRegular12
                        .textColor(appColor(context).appTheme.lightText))
                .paddingOnly(
                    left: Insets.i15, bottom: Insets.i15, right: Insets.i15)
          ]));
    });
  }
}
