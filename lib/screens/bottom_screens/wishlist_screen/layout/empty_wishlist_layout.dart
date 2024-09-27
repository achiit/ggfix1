import '../../../../config.dart';
import '../../../../plugin_list.dart';

class EmptyWishListLayout extends StatelessWidget {
  const EmptyWishListLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context1, theme, child) {
      //direction layout
      return DirectionLayout(
          dChild: Scaffold(
              backgroundColor: appColor(context).appTheme.backGroundColorMain,
              body: SafeArea(
                  //empty wishlist layout
                  child: CommonEmptyPage(
                      height: Sizes.s380,
                      appName: language(context, appFonts.wishlist),
                      imagePath: isTheme(context)
                          ? gifAssets.gifWishlistDark
                          : gifAssets.gifEmptyWishlist,
                      text: language(context, appFonts.emptyWishList),
                      textDescription:
                          language(context, appFonts.emptyWishlistDescription),
                      btnTitle: language(context, appFonts.addNow),
                      onTap: () => route.pop(context)))));
    });
  }
}
