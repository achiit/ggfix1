import 'package:fuzzy/plugin_list.dart';
import '../../../../config.dart';

class SettingSubLayout extends StatelessWidget {
  final int? index;
  final dynamic data;

  const SettingSubLayout({super.key, this.index, this.data});

  @override
  Widget build(BuildContext context) {
    return Consumer3<ThemeService, DirectionProvider, NotificationProvider>(
        builder: (context1, theme, direction, notification, child) {
          //direction layout
      return DirectionLayout(
          dChild: Column(children: [
            //list setting
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(language(context, data['title']),
              style: appCss.dmPoppinsMedium12
                  .textColor(isThemeColorReturn(context))),
          if (data['id'] == 1)
            CommonToggleButton(
                onToggle: (val) => theme.btnMode(), value: theme.getMode)
          else if (data['id'] == 2)
            CommonToggleButton(
                onToggle: (val) => direction.btnDirection(),
                value: direction.getDirection)
          else if (data['id'] == 3)
            CommonToggleButton(
                onToggle: (val) => notification.btnNotification(),
                value: notification.getNotification)
        ]).paddingSymmetric(horizontal: Insets.i20, vertical: Insets.i10),
        const VSpace(Sizes.s5),
        //divider
        if (data['id'] != appArray.settingList.length) CommonWidget().commonDivider(context),
      ]));
    });
  }
}
