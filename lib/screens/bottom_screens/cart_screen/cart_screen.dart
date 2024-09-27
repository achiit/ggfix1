import 'package:fuzzy/plugin_list.dart';
import '../../../config.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<CartProvider, DashboardProvider>(
        builder: (context1, cart, dashboard, child) {
          //back press on device
      return PopScope(
        canPop: false,
        onPopInvoked: (canPop) => cart.onBackPress(canPop, context, dashboard),
        //page load
        child: StatefulWrapper(
            onInit: () => Future.delayed(const Duration(microseconds: 1))
                .then((_) => cart.onReady(context)),
            //direction layout
            child: DirectionLayout(
                dChild: Scaffold(
                    backgroundColor:
                        appColor(context).appTheme.backGroundColorMain,
                    body: SafeArea(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                          Expanded(
                              child: SingleChildScrollView(
                                  child: Column(children: [
                            //appbar layout and back press
                            CommonAppBar(
                                appName: language(context, appFonts.cart),
                                isIcon: true,
                                onPressed: () => dashboard.moveTab(context, 0,
                                    isBack: true)).paddingOnly(
                                top: Insets.i8,
                                left: Insets.i20,
                                right: Insets.i20),
                            //cart list layout
                            Column(children: [
                              ...cart.cartList
                                  .asMap()
                                  .entries
                                  .map((e) => CartSubLayout(
                                        index: e.key,
                                        data: e.value,
                                      ))
                                  .toList()
                            ]).paddingSymmetric(
                                horizontal: Insets.i20, vertical: Insets.i10)
                          ]))),
                          //cart button layout
                          const CartBottomLayout()
                        ]))))),
      );
    });
  }
}
