import 'package:fuzzy/plugin_list.dart';
import '../../../../config.dart';

class CommonNavigationDrawer extends StatelessWidget {
  const CommonNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    double drawerWidth = Sizes.s280;
    return Consumer3<ThemeService, DirectionProvider, DashboardProvider>(
        builder: (themeContext, theme, direction, dashboard, child) {
      return Container(
          width: drawerWidth,
          color: appColor(context).appTheme.backGroundColorMain,
          //listview
          child: ListView(
              padding: const EdgeInsets.all(Sizes.s1),
              children: <Widget>[
                const VSpace(Sizes.s40),
                ListTile(
                    leading: Container(
                        height: Sizes.s36,
                        width: Sizes.s36,
                        //image decor
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: Image.asset(imageAssets.profile)),
                    title: Text(
                        "${language(context, appFonts.hello)} ${language(context, appFonts.nameAgasya)}",
                        style: appCss.dmPoppinsMedium16
                            .textColor(isThemeColorReturn(context))),
                    //svg icon
                    trailing: CommonWidget()
                        .svgAssets(context, svgAssets.iconClose)
                        .inkWell(onTap: () => route.pop(context))),
                ...appArray.drawerList
                    .asMap()
                    .entries
                    .map((e) => Column(children: [
                          //list view in drawer
                          CommonListTile(
                              text: language(context, e.value['title']),
                              //index wise toggle button
                              widget: e.key == 0
                                  ? CommonToggleButton(
                                      onToggle: (val) =>
                                          direction.btnDirection(),
                                      value: direction.getDirection)
                                  : e.key == 1
                                      ? CommonToggleButton(
                                          onToggle: (val) =>
                                              theme.switchTheme(),
                                          value: isTheme(context))
                                      : null,
                              onTap: () => dashboard.onTapList(
                                  e.value, context)),
                          //divider
                          CommonWidget().commonDivider(context),
                        ]))
                    .toList()
              ]));
    });
  }
}
