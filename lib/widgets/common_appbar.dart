import 'package:fuzzy/plugin_list.dart';
import '../config.dart';

class CommonAppBar extends StatelessWidget {
  //final String? iconPath;
  final bool isIcon;
  final String appName;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? margin;

  const CommonAppBar(
      {Key? key,
      this.isIcon = false,
      required this.appName,
      this.onPressed,
      this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeService, DirectionProvider>(
        builder: (context, theme, direction, child) {
      return Stack(children: [
        (isIcon == true)
        //svg icon appbar
            ? IconButton(
                icon: CommonWidget().svgImage(
                    context, svgAssets.iconNextArrow, svgAssets.iconBackArrow),
                onPressed: onPressed,
              )
            : const SizedBox(width: Sizes.s36),
        //title appbar
        Align(
            alignment: Alignment.center,
            child: Text(appName,
                    overflow: TextOverflow.ellipsis,
                    style: appCss.dmPoppinsSemiBold16
                        .textColor(isThemeColorReturn(context)))
                .paddingOnly(top: Insets.i8))
      ]);
    });
  }
}
