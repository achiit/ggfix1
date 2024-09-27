import '../../../../config.dart';
import '../../../../plugin_list.dart';

class DashboardWidget {
  //tab decoration
  BoxDecoration tabDeco(context) =>
      BoxDecoration(color: isThemeColorReturnDark(context), boxShadow: [
        BoxShadow(
            color: appColor(context).appTheme.shadowColorTwo,
            spreadRadius: 1,
            blurRadius: 6)
      ]);

//tab indicator decor
  UnderlineTabIndicator tabIndic(context) => UnderlineTabIndicator(
      insets: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 61.0),
      borderSide:
          BorderSide(color: isThemeColorReturn(context), width: Sizes.s4),
      borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r5)));

//tab svg icon
  Tab onTab(currentIndex, index, context, item) => Tab(
      icon: SvgPicture.asset(
          currentIndex == index ? item['fillIcon'] : item['icon'],
          height: Sizes.s28,
          colorFilter: CommonWidget().colorFilter(context),
          width: Sizes.s28,
          fit: BoxFit.fill));
}
