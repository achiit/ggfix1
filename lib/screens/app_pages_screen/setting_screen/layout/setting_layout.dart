import 'package:fuzzy/plugin_list.dart';
import '../../../../config.dart';

class SettingLayoutOne extends StatelessWidget {
  const SettingLayoutOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context1, theme, child) {
      return Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: Insets.i20, vertical: Insets.i10),
          //decoration
          decoration: CommonWidget().decorSetting(context),
          //setting list layout with toggle button layout
          child: Column(children: [
            ...appArray.settingList
                .asMap()
                .entries
                .map((e) => SettingSubLayout(
                      index: e.value['id'],
                      data: e.value,
                    ))
                .toList()
          ]));
    });
  }
}
