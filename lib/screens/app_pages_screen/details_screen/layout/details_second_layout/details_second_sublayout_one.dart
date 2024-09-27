import '../../../../../config.dart';

class DetailsSubLayoutOne extends StatelessWidget {
  const DetailsSubLayoutOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const VSpace(Sizes.s4),
      Text(language(context, appFonts.descriptionDetails),
          style: appCss.dmPoppinsRegular14
              .textColor(appColor(context).appTheme.lightText)),
      const VSpace(Sizes.s15),
      //amount and stepper increment decrement layout
      const DetailsSecondSubLayoutOne(),
      const VSpace(Sizes.s15),
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //details list layout
          children: appArray.detailsData.asMap().entries.map((e) {
            return DetailsTopContainer(data: e.value);
          }).toList())
    ]).paddingOnly(left: Insets.i20, right: Insets.i20, bottom: Insets.i20);
  }
}
