import 'package:fuzzy/config.dart';
import 'package:fuzzy/plugin_list.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer3<CategoryProvider, ThemeService, DashboardProvider>(
        builder: (context1, category, theme, dashboard, child) {
          //page load
      return StatefulWrapper(
        onInit: () => Future.delayed(const Duration(milliseconds: 10))
            .then((_) => category.onReady(context)),
        //device back press
        child: PopScope(
            canPop: true,
            onPopInvoked: (canPop) =>
                category.onBackPress(context, category.isBack),
            //direction layout
            child: DirectionLayout(
                dChild: Scaffold(
                    backgroundColor:
                        appColor(context).appTheme.backGroundColorMain,
                    body: SafeArea(
                        child: SingleChildScrollView(
                            child: Column(children: [
                      Stack(children: [
                        //appbar layout
                        CommonAppBar(
                            appName: language(context, appFonts.categories)),
                        //notification button layout
                        CommonWidget().topAlign(
                            context,
                            //appbar button notification
                            CommonAppbarButton(
                                imagePath: isTheme(context)
                                    ? svgAssets.iconTopNotificationWhite
                                    : svgAssets.iconTopNotification,
                                onPressed: () => route.pushNamed(
                                    context, routeName.notification)))
                      ]).paddingOnly(
                          top: Insets.i15, left: Insets.i20, right: Insets.i20),
                      //search layout
                      SizedBox(
                              height: Sizes.s48,
                          //text filed
                              child: SearchTextFieldCommon(
                                  controller: category.searchCtrl))
                          .paddingSymmetric(
                              horizontal: Insets.i20, vertical: Insets.i25),
                      //category list layour
                      ...appArray.categories
                          .asMap()
                          .entries
                          .map((e) => CategorySubLayout(
                                index: e.key,
                                data: e.value,
                              ))
                          .toList()
                    ])))))),
      );
    });
  }
}
