import 'package:fuzzy/config.dart';
import '../../../plugin_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer4<HomeProvider, ThemeService, DashboardProvider,
            DirectionProvider>(
        builder: (context1, home, theme, dashboard, direction, child) {
      return StatefulWrapper(
          onInit: () => Future.delayed(const Duration(milliseconds: 1000))
              .then((_) => home.onReady()),
          child: DirectionLayout(
              dChild: Scaffold(
                  backgroundColor:
                      appColor(context).appTheme.backGroundColorMain,
                  body: SafeArea(
                      child: SingleChildScrollView(
                          child: Column(children: [
                    // Home screen top layout
                    const HomeScreenLayout(),
                    //listview furniture
                    const FurnitureListLayout(),
                    Column(children: [
                      //newArrival list
                      const NewArrivalLayout(),
                      //trendFurniture list
                      const TrendFurnitureLayout(),
                      const VSpace(Sizes.s10),
                      //bannerlayout
                      HomeWidget().banner(context, imageAssets.bannerTwo),
                      const VSpace(Sizes.s25)
                    ]).paddingSymmetric(horizontal: Insets.i20),
                    //offerzone Layout
                    const OfferZoneLayout(),
                    Column(children: [
                      //furniture decore layout
                      const FurnitureDecorLayout(),
                      const VSpace(Sizes.s10),
                      //grid layout bottom home page
                      HomeWidget().bannerSquare(context)
                    ]).paddingOnly(
                        left: Insets.i10, right: Insets.i10, bottom: Insets.i20)
                  ]))))));
    });
  }
}
