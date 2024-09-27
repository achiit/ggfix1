import 'package:fuzzy/plugin_list.dart';
import '../../config.dart';

class FilterMainListLayout extends StatelessWidget {
  const FilterMainListLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FilterProvider>(builder: (context1, filter, child) {
      //filter main list
      return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width * 0.35,
          color: appColor(context).appTheme.searchBackground,
          child: SingleChildScrollView(
              child: Column(
                  children: appArray.filterList.asMap().entries.map((e) {
                    //sublist open click event
            return FilterMainSubListText(
              index: e.key,
              data: e.value,
            ).inkWell(onTap: () => filter.updateSelectedIndex(e.key));
          }).toList())));
    });
  }
}
