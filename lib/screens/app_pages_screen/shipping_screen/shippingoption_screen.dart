import '../../../config.dart';
import '../../../plugin_list.dart';

class ShippingOptionScreen extends StatelessWidget {
  const ShippingOptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer3<ShippingProvider, ThemeService, DirectionProvider>(
        builder: (context1, shipping, theme, direction, child) {
      //direction layout
      return DirectionLayout(
        dChild: Scaffold(
            body: SafeArea(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
              SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    //appbar layout
                    Stack(children: [
                      IconButton(
                          //svg image
                          icon: CommonWidget().svgImage(context,
                              svgAssets.iconNextArrow, svgAssets.iconBackArrow),
                          onPressed: () => route.pop(context)),
                      //align
                      Align(
                              alignment: Alignment.center,
                              child: Text(
                                  language(context, appFonts.chooseShipping),
                                  style: appCss.dmPoppinsSemiBold16
                                      .textColor(isThemeColorReturn(context))))
                          .paddingOnly(top: Insets.i10)
                    ]).paddingOnly(bottom: Insets.i20),
                    //shippingOption Layout list
                    ...appArray.shippingChoose
                        .asMap()
                        .entries
                        .map((e) => GestureDetector(
                            onTap: () =>
                                shipping.onSelectShippingOptionMethod(e.key),
                            child: ShippingOptionSubLayout(
                                index: e.key,
                                data: e.value,
                                selectIndex: shipping.selectShippingOptionIndex,
                                onTap: () => shipping
                                    .onSelectShippingOptionMethod(e.key))))
                        .toList()
                  ])),
              //apply button click event
              ButtonCommon(
                  title: language(context, appFonts.apply),
                  color: isThemeButtonColorReturn(context),
                  style: appCss.dmPoppinsRegular16.textColor(isTheme(context)
                      ? appColor(context).appTheme.primaryColor
                      : appColor(context).appTheme.whiteColor),
                  onTap: () => route.pop(context))
            ]).paddingAll(Insets.i20))),
      );
    });
  }
}
