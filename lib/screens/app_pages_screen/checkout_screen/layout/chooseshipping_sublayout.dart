import '../../../../config.dart';

class ChooseShippingSubLayout extends StatelessWidget {
  const ChooseShippingSubLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          width: MediaQuery.of(context).size.width,
          height: Sizes.s55,
          padding: const EdgeInsets.symmetric(horizontal: Insets.i15),
          //decoration
          decoration: CheckOutWidget().decor(context),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(children: [
              //svg image
              CommonWidget().svgAssets(context, svgAssets.iconShipping),
              //divider
              CheckOutWidget()
                  .divider(context, isTheme(context))
                  .paddingSymmetric(horizontal: Insets.i12),
              Text(language(context, appFonts.chooseShippingType),
                  overflow: TextOverflow.ellipsis,
                  style: appCss.dmPoppinsMedium14
                      .textColor(isThemeColorReturn(context)))
            ]),
            //scg image
            CommonWidget().svgAssets(context, svgAssets.iconArrowRight)
          ])
                  .inkWell(
                      onTap: () =>
                          route.pushNamed(context, routeName.shippingScreen))
                  )
    ]);
  }
}
