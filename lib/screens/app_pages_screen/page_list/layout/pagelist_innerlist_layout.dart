import '../../../../config.dart';
import '../../../../plugin_list.dart';

class PageListInnerListLayout extends StatelessWidget {
  final dynamic subData;
  const PageListInnerListLayout({super.key, this.subData});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeService, PageListProvider>(
        builder: (context1, theme, pageList, child) {
      //page list sub layout and click event
      return GestureDetector(
          child: Row(children: [
            Expanded(
                flex: 2,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.04,
                    color: appColor(context).appTheme.backGroundColorMain,
                    padding: const EdgeInsets.all(Insets.i5),
                    child: Text(language(context, subData['subtitle']),
                            style: appCss.dmPoppinsMedium14.textColor(
                                appColor(context).appTheme.lightText)))),
            SvgPicture.asset(
              svgAssets.iconArrowRight,
              fit: BoxFit.scaleDown,
              colorFilter: ColorFilter.mode(
                  appColor(context).appTheme.lightText, BlendMode.srcIn),
            ).paddingAll(Insets.i5)
          ]),
          onTap: () =>
              pageList.onSelectedListPage(subData/*['subtitle']*/, context));
    });
  }
}
