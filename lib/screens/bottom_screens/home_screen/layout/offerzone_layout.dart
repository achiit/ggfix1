import 'package:fuzzy/plugin_list.dart';
import '../../../../config.dart';

class OfferZoneLayout extends StatelessWidget {
  const OfferZoneLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeProvider, ThemeService>(
        builder: (context1, home, theme, child) {
      return Stack(children: [
        Container(
            color: appColor(context).appTheme.containerZone,
            child: Column(children: [
              //offer zone text layout
              HomeWidget().listNameCommon(
                  context,language(context, appFonts.offer))
                  .paddingOnly(
                      top: Insets.i20,
                      left: Insets.i20,
                      right: Insets.i20,
                      bottom: Insets.i15),
              Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  color: appColor(context).appTheme.containerZone,
                  child: GridView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: home.newOfferZone.length,
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              childAspectRatio: 0.38,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              maxCrossAxisExtent: 160),
                      itemBuilder: (context, index) {
                        //offerZone layout and click event product list
                        return OfferZoneGridLayout(
                          data: home.newOfferZone[index],
                          index: index,
                        ).inkWell(
                            onTap: () =>
                                route.pushNamed(context, routeName.chairData));
                      })).paddingOnly(left: Insets.i20, right: Insets.i15),
              const VSpace(Sizes.s20),
            ]))
      ]);
    });
  }
}
