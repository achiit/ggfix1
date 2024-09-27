import 'package:fuzzy/config.dart';
import 'package:fuzzy/plugin_list.dart';

class AppbarSubLayout extends StatelessWidget {
  const AppbarSubLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DirectionProvider>(builder: (context1, direction, child) {
      return Stack(children: [
        //check out app layout
        CommonAppBar(
          appName: language(context, appFonts.checkOut),
          isIcon: true,
          onPressed: () => route.pop(context),
        ),
        //align set
        CommonWidget().topAlign(
          context,
          //wishlist button layout on appbar
          CommonAppbarButton(
              imagePath: svgAssets.iconWishlist,
              color: ColorFilter.mode(
                  isThemeColorReturn(context), BlendMode.srcIn),
              onPressed: () =>
                  route.pushNamed(context, routeName.wishlist, arg: true)),
        )
      ]).paddingOnly(top: Insets.i10, bottom: Insets.i20);
    });
  }
}
