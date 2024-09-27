import '../../../../config.dart';
import '../../../../plugin_list.dart';

class TrendFurnitureLayout extends StatelessWidget {
  const TrendFurnitureLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeProvider, ThemeService>(
        builder: (context1, home, theme, child) {
      return Stack(children: [
        Column(children: [
          const VSpace(Sizes.s25),
          //trendFurniture name
          HomeWidget().listNameCommon(
              context,language(context, appFonts.trendFurniture)),
          const VSpace(Sizes.s15),
          //trendFurniture list and click event
          ...home.newTrendFurniture
              .asMap()
              .entries
              .map((e) => TrendFurnitureList(
                    index: e.key,
                    data: e.value,
                  ).inkWell(
                      onTap: () =>
                          route.pushNamed(context, routeName.chairData)))
              .toList()
        ])
      ]);
    });
  }
}
