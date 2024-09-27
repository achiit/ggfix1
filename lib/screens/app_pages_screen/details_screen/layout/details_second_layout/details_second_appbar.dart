import '../../../../../config.dart';
import '../../../../../plugin_list.dart';

class SecondDetailsAppbar extends StatelessWidget {
  const SecondDetailsAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailsProvider>(builder: (context1, details, child) {
      return Stack(children: [
        IconButton(
            //svg image appbar arrow
            icon: CommonWidget().svgImage(
                context, svgAssets.iconNextArrow, svgAssets.iconBackArrow),
            onPressed: () => route.pop(context)),
        //appbar name
        Align(
                alignment: Alignment.center,
                child: Text(language(context, appFonts.chair),
                    style: appCss.dmPoppinsSemiBold16
                        .textColor(isThemeColorReturn(context))))
            .paddingOnly(top: Insets.i10),
//wishlist button layout on appbar
        CommonWidget().topAlign(
            context,
            CommonAppbarButtonDetails(
                colorSvg: isTheme(context)
                    ? details.isWishlist
                        ? appColor(context).appTheme.linkErrorColor
                        : appColor(context).appTheme.whiteColor
                    : details.isWishlist
                        ? appColor(context).appTheme.linkErrorColor
                        : appColor(context).appTheme.primaryColor,
                imagePath: details.isWishlist
                    ? svgAssets.iconWishlistOne
                    : svgAssets.iconWishlist,
                onTap: () => details.onWishlistIn())),
        // search button layout on appbar and click event
        CommonWidget()
            .topAlign(
              context,
              CommonAppbarButtonDetails(
                  colorSvg: isThemeColorReturn(context),
                  imagePath: svgAssets.iconSearchFill,
                  onTap: () => route.pushNamed(context, routeName.chairData)),
            )
            .paddingOnly(left: Insets.i50, right: Insets.i50),
      ]).paddingOnly(top: Insets.i10, left: Insets.i20, right: Insets.i20);
    });
  }
}
