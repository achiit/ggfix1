import 'package:fuzzy/plugin_list.dart';
import '../../../../config.dart';

class DashboardTabLayout extends StatelessWidget {
  const DashboardTabLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<DashboardProvider, ThemeService>(
        builder: (context, dashboard, theme, child) {
      return DefaultTabController(
          length: appArray.dashboardList.length,
          child: Container(
              height: Sizes.s65,
              width: MediaQuery.of(context).size.width,
              //decoration
              decoration: DashboardWidget().tabDeco(context),
              child: TabBar(
                  onTap: (index) => dashboard.changeTab(index, context),
                  //list dashboard list
                  tabs: appArray.dashboardList
                      .asMap()
                      .entries
                      .map((MapEntry<int, dynamic> entry) {
                    int index = entry.key;
                    dynamic item = entry.value;
                    //tab widget
                    return DashboardWidget()
                        .onTab(dashboard.currentIndex, index, context, item);
                  }).toList(),
                  controller: dashboard.tabController,
                  overlayColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return isThemeColorReturnDark(context); // Example color
                    }
                    return appColor(context)
                        .appTheme
                        .lightText
                        .withOpacity(0.5);
                  }),
                  unselectedLabelColor: appColor(context).appTheme.whiteColor,
                  isScrollable: false,
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: isThemeColorReturnDark(context),
                  //indicator
                  indicator: DashboardWidget().tabIndic(context),
                  indicatorPadding: const EdgeInsets.only(
                      left: Insets.i22, right: Insets.i22))));
    });
  }
}
