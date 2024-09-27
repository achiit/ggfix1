import 'package:fuzzy/plugin_list.dart';
import '../../../config.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer3<CartProvider, WishlistProvider, ThemeService>(
        builder: (context1, cart, wishlistProvider, theme, child) {
      return StatefulWrapper(
          //load event
          onInit: () => Future.delayed(const Duration(milliseconds: 10))
              .then((_) => cart.onReady(context)),
          //direction
          child: DirectionLayout(
              dChild: Scaffold(
                  backgroundColor:
                      appColor(context).appTheme.backGroundColorMain,
                  body: SafeArea(
                      child: Column(children: [
                    Expanded(
                        child: SingleChildScrollView(
                            child: Column(children: [
                      // app layout
                      const AppbarSubLayout(),
                      //shipping address text layout
                      CheckOutWidget().mainAllText(context,
                          mainText:
                              language(context, appFonts.shippingAddress)),
                      //shipping address layout
                      const ShippingAddressSubLayout(),
                      //cart list data and sub layout divider
                      const CartListData(),
                      //choose shipping layout
                      const ChooseShippingSubLayout(),
                      const VSpace(Sizes.s25),
                      //divider in checkout
                      CommonWidget().commonDivider(context),
                      const VSpace(Sizes.s20),
                      //promo code text layout
                      CheckOutWidget().mainAllText(context,
                          mainText: language(context, appFonts.promoCode)),
                      const VSpace(Sizes.s10),
                      //promo code layout
                      const PromoCodeSubLayout(),
                      const VSpace(Sizes.s25),
                      //order info text layout
                      CheckOutWidget().mainAllText(context,
                          mainText: language(context, appFonts.orderInfo)),
                      const VSpace(Sizes.s15),
                      //order info layout
                      const OrderSubLayout(),
                      const VSpace(Sizes.s25),
                      //continue payment layout
                      ButtonCommon(
                          title: language(context, appFonts.continuePayment),
                          color: isThemeButtonColorReturn(context),
                          style: appCss.dmPoppinsRegular16
                              .textColor(isThemeColorReturnDark(context)),
                          radius: AppRadius.r10,
                          onTap: () => cart.clickOnCheckOut(
                              context, cart.isBack)).paddingOnly(
                          bottom: Insets.i10)
                    ])).paddingSymmetric(horizontal: Insets.i20))
                  ])))));
    });
  }
}
