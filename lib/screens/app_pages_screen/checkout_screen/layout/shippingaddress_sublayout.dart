import 'package:fuzzy/plugin_list.dart';
import '../../../../config.dart';

class ShippingAddressSubLayout extends StatelessWidget {
  const ShippingAddressSubLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const VSpace(Sizes.s15),
      Container(
          width: MediaQuery.of(context).size.width,
          //decoration
          decoration: CheckOutWidget().decorWithShadow(context),
          child: Stack(children: [
            Row(children: [
              SizedBox(
                      height: Sizes.s57,
                      width: Sizes.s57,
                      //svg icon
                      child: SvgPicture.asset(svgAssets.iconShippingLocation,
                          fit: BoxFit.scaleDown))
                  .paddingSymmetric(horizontal: Insets.i10),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                //text layout
                Text(language(context, appFonts.home),
                    style: appCss.dmPoppinsSemiBold15
                        .textColor(isThemeColorReturn(context))),
                const VSpace(Sizes.s5),
                //text layout
                Text(language(context, appFonts.homeAddress),
                    style: appCss.dmPoppinsRegular13
                        .textColor(appColor(context).appTheme.lightText))
              ])
            ]).paddingSymmetric(vertical: Insets.i8),
            //align set
            CommonWidget().bottomAlign(
                context,
                Container(
                        height: Sizes.s24,
                        margin: EdgeInsets.only(
                            left: Insets.i15,
                            right: Insets.i15,
                            top: MediaQuery.of(context).size.height * 0.04,
                            bottom: Insets.i5),
                        width: Sizes.s24,
                        //edit icon set
                        child: CommonWidget()
                            .svgAssets(context, svgAssets.iconShippingEdit))
                    .inkWell(
                        onTap: () =>
                            route.pushNamed(context, routeName.addNewAddress)))
          ]))
    ]);
  }
}
