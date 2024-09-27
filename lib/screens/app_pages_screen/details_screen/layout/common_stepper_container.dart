import '../../../../config.dart';
import '../../../../plugin_list.dart';

class CommonStepperContainer extends StatelessWidget {
  const CommonStepperContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailsProvider>(builder: (context1, details, child) {
      return Container(
          height: Sizes.s44,
          width: Sizes.s135,
          //stepper container decoration
          decoration: DetailsWidget().stepperContainer(context),
          child: Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                //svg image
                CommonWidget()
                    .svgAssets(context, svgAssets.iconDecrement)
                    .inkWell(
                        onTap: () => details.decrementProduct(details.qty)),
                //vertical divider
                DetailsWidget().verticalDivider(context),
                //qty text
                Text(language(context, details.qty.toString()),
                    textAlign: TextAlign.center,
                    style: appCss.dmPoppinsRegular16
                        .textColor(isThemeColorReturn(context))),
                //vertical divider
                DetailsWidget().verticalDivider(context),
                //svg image
                CommonWidget()
                    .svgAssets(context, svgAssets.iconIncrement)
                    .inkWell(onTap: () => details.incrementProduct(details.qty))
              ]).paddingSymmetric(horizontal: Insets.i12)));
    });
  }
}
