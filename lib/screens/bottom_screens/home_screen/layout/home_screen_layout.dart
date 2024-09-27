import 'package:fuzzy/plugin_list.dart';
import '../../../../config.dart';

class HomeScreenLayout extends StatelessWidget {
  const HomeScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return  Consumer<HomeProvider>(
      builder: (context1,home,child) {
        return Column(children: [
          VSpace(MediaQuery.of(context).size.height * 0.02),
          //Home page Appbar
          const HomeAppBarLayout(),
          const VSpace(Sizes.s25),
          //filter layout
          CommonWidget().filterLayout(home.searchCtrl, context),
          const VSpace(Sizes.s25),
          //banner
         HomeWidget().banner(context, imageAssets.bannerOne),
          const VSpace(Sizes.s25)
        ]).paddingSymmetric(horizontal: Insets.i20);
      }
    );
  }
}
