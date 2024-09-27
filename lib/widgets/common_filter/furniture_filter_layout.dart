import 'package:fuzzy/plugin_list.dart';
import '../../config.dart';

class FurnitureFilterLayout extends StatelessWidget {
  const FurnitureFilterLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<FilterProvider, DirectionProvider>(
        builder: (context2, filter, direction, child) {
      return DirectionLayout(
        dChild: Scaffold(
            backgroundColor: appColor(context).appTheme.backGroundColorMain,
            //appbar text
            appBar: AppBar(
              title: Text(language(context, appFonts.filter),
                  overflow: TextOverflow.ellipsis,
                  style: appCss.dmPoppinsSemiBold16
                      .textColor(isThemeColorReturn(context))),
              centerTitle: true,
              backgroundColor: appColor(context).appTheme.backGroundColorMain,
              // appbar icon
              leading: IconButton(
                  icon: CommonWidget()
                      .svgImage(context, svgAssets.iconNextArrow,
                          svgAssets.iconBackArrow)
                      .paddingOnly(left: Insets.i10),
                  onPressed: () => route.pop(context)),
            ),
            body: const SafeArea(
                child: Stack(children: [
              //FilterAppBar(),
              Row(
                children: [
                  //filter list
                  FilterMainListLayout(),
                  //filter sublist sortby
                  FilterSortSubLayout(),
                  //filter sublist color
                  FilterColorSubLayout(),
                  //filter sublist price
                  FilterSubLayoutPrice(),
                  //filter sublist dimension
                  FilterSubLayoutDimension(),
                ],
              ),
              //bottom button layout
              Align(
                  alignment: Alignment.bottomCenter,
                  child: FilterButtonSubLayout()),
            ]))),
      );
    });
  }
}
