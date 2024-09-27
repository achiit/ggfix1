import '../../../../../config.dart';
import '../../../../../plugin_list.dart';

class DetailsSecondDetailSubLayout extends StatelessWidget {
  const DetailsSecondDetailSubLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context1, theme, child) {
      return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
            flex: 2,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(language(context, appFonts.ratingDetail),
                      style: appCss.dmPoppinsBold16
                          .textColor(isThemeColorReturn(context))),
                  //rating bar
                  CommonWidget().ratingBar(),
                  const VSpace(Sizes.s10),
                  //rating details
                  Text(language(context, appFonts.ratingDetails),
                      overflow: TextOverflow.ellipsis,
                      style: appCss.dmPoppinsRegular12
                          .textColor(appColor(context).appTheme.lightText)),
                  const VSpace(Sizes.s3),
                  //review data
                  Text(language(context, appFonts.reviewsData),
                      style: appCss.dmPoppinsRegular12.textColor(
                          isTheme(context)
                              ? appColor(context).appTheme.lightText
                              : appColor(context).appTheme.primaryColor))
                ]).paddingOnly(left: Insets.i10)),
        //vertical dash line
        Dash(
                direction: Axis.vertical,
                length: Sizes.s80,
                dashLength: Sizes.s5,
                dashThickness: Sizes.s2,
                dashColor: isTheme(context)
                    ? appColor(context).appTheme.lightText.withOpacity(0.34)
                    : appColor(context).appTheme.shadowColor)
            .paddingOnly(right: Insets.i20, left: Insets.i25),
        //rating chart layout
        const Expanded(flex: 4, child: CommonChatLayout())
      ]);
    });
  }
}
