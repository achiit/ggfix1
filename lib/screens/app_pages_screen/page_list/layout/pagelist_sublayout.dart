import 'package:fuzzy/plugin_list.dart';
import '../../../../config.dart';

class PageListSubLayout extends StatelessWidget {
  final dynamic data, subData;

  const PageListSubLayout({super.key, this.data, this.subData});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeService, PageListProvider>(
        builder: (context1, theme, pageList, child) {
      return Column(children: [
        const VSpace(Sizes.s10),
        Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(Insets.i10),
            //decoration
            decoration: CommonWidget().decorPageList(context),
            child: Text(language(context, data['title']),
                    style: appCss.dmPoppinsMedium16
                        .textColor(isThemeColorReturn(context)))),
        const VSpace(Sizes.s5),
        //listview sub list layout
        Container(
            color: appColor(context).appTheme.backGroundColorMain,
            //inner list layout
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: subData.length,
                itemBuilder: (BuildContext context, int innerIndex) {
                  return PageListInnerListLayout(subData: subData[innerIndex]);
                }))
      ]);
    });
  }
}
