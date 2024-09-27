import 'package:fuzzy/plugin_list.dart';
import '../../../config.dart';

class EmptySearchLayout extends StatelessWidget {
  const EmptySearchLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeService, DirectionProvider>(
        builder: (context1, theme, direction, child) {
      return DirectionLayout(
        dChild: Scaffold(
            backgroundColor: appColor(context).appTheme.backGroundColorMain,
            body: SafeArea(
                //search empty layout
                child: CommonEmptyPage(
              height: Sizes.s180,
              appName: language(context, appFonts.search),
              imagePath: isTheme(context)
                  ? gifAssets.gifSearchDark
                  : gifAssets.gifEmptySearch,
              text: language(context, appFonts.searchTitle),
              textDescription: language(context, appFonts.searchDescription),
              isVisible: false,
              btnTitle: language(context, appFonts.search),
            ))),
      );
    });
  }
}
