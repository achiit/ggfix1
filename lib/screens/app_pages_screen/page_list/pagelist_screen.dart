import 'package:fuzzy/config.dart';
import 'package:fuzzy/plugin_list.dart';

class PageList extends StatelessWidget {
  const PageList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<PageListProvider, ThemeService>(
        builder: (context1, pageList, theme, child) {
          //direction layout
      return DirectionLayout(
        dChild: Scaffold(
            backgroundColor: appColor(context).appTheme.backGroundColorMain,
            body: SafeArea(
                child: SingleChildScrollView(
                    child: Column(children: [
              //appbar for page list page
              CommonAppBar(
                      appName: language(context, appFonts.pageList),
                      isIcon: true,
                      onPressed: () => route.pop(context))
                  .paddingSymmetric(vertical: Insets.i10),
              //page listview list layout
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: appArray.pageList.length,
                  itemBuilder: (BuildContext context, int index) {
                    pageList.selectedIndex = index;
                    final currentItem =
                        appArray.pageList[pageList.selectedIndex]['screen'];
                    return PageListSubLayout(
                        data: appArray.pageList[index], subData: currentItem);
                  }),
              const VSpace(Sizes.s20)
            ]).paddingSymmetric(horizontal: Insets.i20)))),
      );
    });
  }
}
