import '../../../../config.dart';
import '../../../../plugin_list.dart';

class FurnitureDecorLayout extends StatelessWidget {
  const FurnitureDecorLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeProvider, ThemeService>(
        builder: (context1, home, theme, child) {
      return Stack(children: [
        Column(children: [
          //main text name
          HomeWidget().listNameCommon(
                  context,language(context, appFonts.furnitureDecor))
              .paddingOnly(
                  top: Insets.i25, left: Insets.i10, bottom: Insets.i15),
          GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: home.newFurnitureDecor.length,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 0.712,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  maxCrossAxisExtent: 200),
              itemBuilder: (context, index) {
                //furniture decor sub layout and click event
                return FurnitureDecorSubLayout(
                  index: index,
                  data: home.newFurnitureDecor[index],
                ).inkWell(
                    onTap: () => route.pushNamed(context, routeName.chairData));
              }).paddingSymmetric(horizontal: Insets.i10)
        ])
      ]);
    });
  }
}
