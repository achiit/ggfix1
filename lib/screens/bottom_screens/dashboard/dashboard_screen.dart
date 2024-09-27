import '../../../config.dart';
import '../../../plugin_list.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Consumer2<DashboardProvider, HomeProvider>(
        builder: (context1, dashboard, home, child) {
      return StatefulWrapper(
        //page load
        onInit: () => Future.delayed(const Duration(milliseconds: 50),
            () => dashboard.initTabController(this, context)),
        //device back press
        child: PopScope(
            canPop: false,
            onPopInvoked: (canPop) =>
                dashboard.onBackPress(dashboard.currentIndex),
            //direction layout
            child: DirectionLayout(
                dChild: Scaffold(
                    key: dashboard.scaffoldKey,
                    //navigation layout
                    drawer: const CommonNavigationDrawer(),
                    backgroundColor: isThemeColorReturnDark(context),
                    body: SafeArea(
                        child: dashboard.tabController != null
                            ? TabBarView(
                                controller: dashboard.tabController,
                                physics: const NeverScrollableScrollPhysics(),
                                children: dashboard.pages)
                            : const CircularProgressIndicator()),
                    bottomNavigationBar: Material(
                        color: isThemeColorReturnDark(context),
                        //dashboard tab layout
                        child: const DashboardTabLayout())))),
      );
    });
  }
}
