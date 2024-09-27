import 'package:fuzzy/plugin_list.dart';
import '../../config.dart';

class FilterColorListSubLayout extends StatelessWidget {
  final dynamic currentItem;

  const FilterColorListSubLayout({super.key, this.currentItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<FilterProvider>(builder: (context1, filter, child) {
      //filter color layout and on tap event
      return GestureDetector(
          onTap: () => filter.isCheckBoxColor(currentItem['colorCode']),
          child:
          Container(
                  height: MediaQuery.of(context).size.height * 0.055,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppRadius.r6),
                      border: Border.all(
                          width: Sizes.s1,
                          color: appColor(context).appTheme.shadowColorSix),
                      color: appColor(context).appTheme.searchBackground),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Container(
                                  alignment: Alignment.center,
                                  width: Sizes.s20,
                                  height: Sizes.s20,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 1.0,
                                          color: currentItem['colorCode'])),
                                  child: Container(
                                      alignment: Alignment.center,
                                      width: Sizes.s15,
                                      height: Sizes.s15,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: currentItem['colorCode'])))
                              .paddingAll(Insets.i8),
                          Text(
                              language(
                                  context, currentItem['subtitle'].toString()),
                              style: appCss.dmPoppinsRegular14
                                  .textColor(isThemeColorReturn(context)))
                        ]),
                        CheckBoxCommon(
                                isCheck: filter.isSelectColor
                                    ? filter.isSelectColor
                                    : filter.selectedColor.contains(currentItem['colorCode']),
                                onTap: () => filter.isCheckBoxColor(
                                        currentItem['colorCode']))
                            .paddingSymmetric(horizontal: Insets.i10)
                      ]))
              .paddingOnly(
                  left: Insets.i20, top: Insets.i15, right: Insets.i20));
    });
  }
}
