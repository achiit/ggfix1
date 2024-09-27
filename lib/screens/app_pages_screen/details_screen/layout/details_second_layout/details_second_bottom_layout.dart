import '../../../../../config.dart';
import '../../../../../plugin_list.dart';

class DetailsSecondBottomLayout extends StatelessWidget {
  const DetailsSecondBottomLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, theme, child) {
      return Container(
              width: MediaQuery.of(context).size.width,
              height: Sizes.s68,
              color: appColor(context).appTheme.backGroundColorMain,
              child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: Sizes.s52,
                      //decoration
                      decoration: DetailsWidget().decorationButton(context),
                      margin: const EdgeInsets.symmetric( horizontal: Insets.i20, vertical: Insets.i10),
                      //bottom button layout
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const HSpace(Sizes.s10),
                                  //svg icon cart
                                  CommonWidget()
                                      .svgAssetsOne(context, svgAssets.iconCart)
                                      .paddingOnly(
                                          left: Insets.i5, right: Insets.i8),
                                  //add to cart text
                                  Text(language(context, appFonts.cartAdd),
                                      style: appCss.dmPoppinsRegular16
                                          .textColor(theme.isDarkMode
                                              ? appColor(context)
                                                  .appTheme
                                                  .primaryColor
                                              : appColor(context)
                                                  .appTheme
                                                  .whiteColor))
                                ]),
                            Row(children: [
                              //divider
                              DetailsWidget().divider(context),
                              const HSpace(Sizes.s20),
                              //amount
                              Text(
                                  language(context,
                                      '${getSymbol(context)}${(currency(context).currencyVal * double.parse(language(context, appFonts.detailsPrice))).toStringAsFixed(1)}'),
                                  overflow: TextOverflow.ellipsis,
                                  style: appCss.dmPoppinsRegular16.textColor(
                                      isThemeColorReturnDark(context)))
                            ]).paddingSymmetric(horizontal: Insets.i20)
                          ])))
          .inkWell(onTap: () => route.pop(context));
    });
  }
}
