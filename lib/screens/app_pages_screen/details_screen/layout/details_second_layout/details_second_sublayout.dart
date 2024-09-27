import '../../../../../config.dart';

class DetailsSecondSubLayout extends StatelessWidget {
  const DetailsSecondSubLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        //chair name text
        Text(language(context, appFonts.chairName),
                style: appCss.dmPoppinsSemiBold16
                    .textColor(isThemeColorReturn(context)))
            .paddingSymmetric(horizontal: Insets.i20),
        //offer layout
        const CommonOffLayout()
      ]).paddingOnly(top: Insets.i70),
      //details name,stepper,list layout of top data
      const DetailsSubLayoutOne(),
    ]);
  }
}
