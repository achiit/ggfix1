import 'package:fuzzy/plugin_list.dart';
import '../../../../config.dart';

class FurnitureListLayout extends StatelessWidget {
  const FurnitureListLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeProvider, ThemeService>(
        builder: (context1, home, theme, child) {
      return Column(children: [
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            //Furniture List View
            child: Row(children: [
              //list furniture and list click event
              ...appArray.furnitureType
                  .asMap()
                  .entries
                  .map((e) => FurnitureListSubLayout(
                        index: e.key,
                        data: e.value,
                      ))
                  .toList()
            ])).paddingOnly(left: Insets.i15),
        const VSpace(Sizes.s25),
        //new arrival name display
        HomeWidget().listNameCommon(
            context,language(context, appFonts.newArrival))
            .paddingSymmetric(horizontal: Insets.i20),
        const VSpace(Sizes.s15)
      ]);
    });
  }
}
