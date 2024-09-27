import 'package:fuzzy/plugin_list.dart';
import '../../../../config.dart';

class ProfileSubLayout extends StatelessWidget {
  const ProfileSubLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ProfileProvider, ThemeService>(
        builder: (context1, profile, theme, child) {
      return StatefulWrapper(
        //page load event
        onInit: () => Future.delayed(const Duration(milliseconds: 50))
            .then((_) => profile.onReady(context)),
        child: Expanded(
            flex: 2,
            child: SingleChildScrollView(
                child: Column(children: [
                  //profile list layout
              ...appArray.profileList
                  .asMap()
                  .entries
                  .map((e) => ProfileListLayout(
                        index: e.key,
                        data: e.value,
                      ).inkWell(onTap: () => profile.onTapList(e.value, context),))
                  .toList()
            ]))),
      );
    });
  }
}
