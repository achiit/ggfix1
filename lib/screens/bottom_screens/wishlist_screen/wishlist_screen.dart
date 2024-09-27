import '../../../config.dart';
import '../../../plugin_list.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<WishlistProvider, DashboardProvider>(
        builder: (context1, wishlist, dashboard, child) {
      //device back press
      return PopScope(
          canPop: true,
          onPopInvoked: (canPop) =>
              wishlist.onBackPress(context, wishlist.isBack, dashboard),
          child: StatefulWrapper(
              onInit: () => Future.delayed(const Duration(milliseconds: 50))
                  .then((_) => wishlist.onReady(context)),
              child: DirectionLayout(
                  dChild: Scaffold(
                      backgroundColor:
                          appColor(context).appTheme.backGroundColorMain,
                      body: SafeArea(
                          child: SingleChildScrollView(
                              child: Column(children: [
                        //appbar layout and back press
                        CommonAppBar(
                          appName: language(context, appFonts.wishlist),
                          onPressed: () =>
                              wishlist.onDeviceBack(context, wishlist.isBack),
                          isIcon: true,
                        ).paddingSymmetric(
                            horizontal: Insets.i20, vertical: Insets.i10),
                        //wishlist list layout
                        ...wishlist.wishListData
                            .asMap()
                            .entries
                            .map((e) => WishlistSubLayout(
                                  index: e.key,
                                  data: e.value,
                                ).paddingOnly(
                                    left: Insets.i20,
                                    right: Insets.i20,
                                    bottom: Insets.i10))
                            .toList()
                      ])))))));
    });
  }
}
