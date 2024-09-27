import 'package:fuzzy/plugin_list.dart';
import '../../../../config.dart';

class ProfileAppbarLayout extends StatelessWidget {
  const ProfileAppbarLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(builder: (context1, profile, child) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                height: Sizes.s114,
                width: MediaQuery.of(context).size.width,
                color: appColor(context).appTheme.searchBackground,
                child: Column(children: [
                  //appbar
                  CommonAppBar(
                          appName: language(context, appFonts.profile),
                          isIcon: true,
                          onPressed: () =>
                              profile.onBackPress(context, profile.isBack))
                      .paddingSymmetric(horizontal: Insets.i20)
                      .paddingOnly(top: Insets.i10)
                ])),
            const VSpace(Sizes.s35),
            //profile list of layout
            const ProfileSubLayout()
          ]);
    });
  }
}
