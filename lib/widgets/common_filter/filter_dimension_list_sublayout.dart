import '../../config.dart';
import '../../plugin_list.dart';

class FilterDimensionListSubLayout extends StatelessWidget {
  final dynamic currentItem;
  const FilterDimensionListSubLayout({super.key, this.currentItem});

  @override
  Widget build(BuildContext context) {
    return  Consumer<FilterProvider>(builder: (context1, filter, child) {
      //dimension layout and on click event
        return GestureDetector(
          onTap: () => filter
              .isCheckBoxDimension(currentItem['subtitle']),
          child: Row(children: [
            CheckBoxCommon(
                isCheck: filter.selectDimension
                    .contains(currentItem['subtitle']),
                onTap: () => filter.isCheckBoxDimension(
                    currentItem['subtitle'])).paddingOnly(
                right: Insets.i20, left: Insets.i20),
            Expanded(
              flex: 3,
              child: Text(
                  language(context,
                      currentItem['subtitle'].toString()),
                  overflow: TextOverflow.ellipsis,
                  style: appCss.dmPoppinsRegular14.textColor(
                      isThemeColorReturn(context))),
            )
          ]).paddingOnly(left: Insets.i20, top: Insets.i20),
        );
      }
    );
  }
}
