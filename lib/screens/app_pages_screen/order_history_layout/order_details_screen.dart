import 'package:fuzzy/config.dart';
import 'package:fuzzy/plugin_list.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailsProvider>(builder: (context, details, child) {
      return DirectionLayout(
          dChild: StatefulWrapper(
              onInit: () => Future.delayed(const Duration(milliseconds: 50))
                  .then((_) => details.onReady(context)),
              child: Scaffold(
                  backgroundColor:
                      appColor(context).appTheme.backGroundColorMain,
                  body: SafeArea(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                        SingleChildScrollView(
                            child: Column(children: [
                          //order details appbar layout
                          CommonAppBar(
                              appName: language(context, appFonts.orderDetail),
                              isIcon: true,
                              onPressed: () => route
                                  .pop(context)).paddingOnly(top: Insets.i10),
                          const VSpace(Sizes.s20),
                          //order details top container data
                          const OrderDetailsSubLayoutOne(),
                          const VSpace(Sizes.s15),
                          //order details center container data
                          const OrderDetailsSubLayoutTwo(),
                          const VSpace(Sizes.s15),
                          //order details bottom container data
                          const OrderDetailsSubLayoutThree()
                        ])),
                        //button layout
                        ButtonCommon(
                            title: language(context, appFonts.downloadInvoice),
                            color: isThemeButtonColorReturn(context),
                            style: appCss.dmPoppinsRegular16
                                .textColor(isThemeColorReturnDark(context)),
                            radius: AppRadius.r10,
                            onTap: () =>
                                details.onOrderDetails(context, details.isBack))
                      ]).paddingOnly(
                          left: Insets.i20,
                          right: Insets.i20,
                          bottom: Insets.i10)))));
    });
  }
}
