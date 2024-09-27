import '../../../../config.dart';
import '../../../../plugin_list.dart';

class CommonListTile extends StatelessWidget {
  final String text;
  final Widget? widget;
  final GestureTapCallback? onTap;

  const CommonListTile({super.key, required this.text, this.widget, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context1, theme, child) {
      //listTile design
      return ListTile(
        title: Text(text,/*Text(language(context, appFonts.dark)*/
            style: appCss.dmPoppinsMedium14
                .textColor(isThemeColorReturn(context))),
        onTap: onTap,
        trailing: SizedBox(
          height: Sizes.s25,
          width: Sizes.s50,
          child: widget /*CommonToggleButton(
                onToggle: (val) => theme.switchTheme(),
                value: isTheme(context))*/
        )
      );
    });
  }
}
