import 'package:fuzzy/config.dart';
import 'package:fuzzy/plugin_list.dart';

class TrackingOrderScreen extends StatelessWidget {
  const TrackingOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeService, ShippingProvider>(
        builder: (context1, theme, shipping, child) {
      //direction
      return DirectionLayout(
          //page load
          dChild: StatefulWrapper(
              onInit: () => Future.delayed(const Duration(milliseconds: 10))
                  .then((_) => shipping.onReady(context)),
              child: Scaffold(
                  backgroundColor:
                      appColor(context).appTheme.backGroundColorMain,
                  body: SafeArea(
                      child: SingleChildScrollView(
                          child: Column(children: [
                    //appbar tracking layout
                    CommonAppBar(
                            appName: language(context, appFonts.orderTracker),
                            isIcon: true,
                            onPressed: () =>
                                shipping.onBtnTrackingClick(shipping, context))
                        .paddingSymmetric(vertical: Insets.i10),
                    //tracking top container layout
                    const TrackingTopLayout(),
                    //tracking order journey layout
                    const TrackingOrderJourneyLayout(),
                    //tracking bottom button layout and click event
                    Column(children: [
                      const VSpace(Sizes.s25),
                      //order sub layout
                      const OrderSubLayout(),
                      const VSpace(Sizes.s25),
                      //continue shipping button
                      ButtonCommon(
                          title: language(context, appFonts.continueShopping),
                          color: isThemeButtonColorReturn(context),
                          style: appCss.dmPoppinsRegular16
                              .textColor(isThemeColorReturnDark(context)),
                          radius: AppRadius.r10,
                          onTap: () => shipping.onBtnTrackingClick(
                              shipping, context)).paddingOnly(
                          bottom: Insets.i10)
                    ])
                  ]).paddingSymmetric(horizontal: Insets.i20))))));
    });
  }
}
