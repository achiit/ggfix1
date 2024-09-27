import '../../config.dart';
import 'package:fuzzy/plugin_list.dart';

class FilterIconCommon extends StatelessWidget {
  final VoidCallback onPressed;
  final double? radius;

  const FilterIconCommon({
    super.key,
    required this.onPressed,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, theme, child) {
      //common icon layout
      return GestureDetector(
          onTap: onPressed,
          child: Container(
              height: Sizes.s48,
              width: Sizes.s48,
              decoration: BoxDecoration(
                color: appColor(context).appTheme.searchBackground,
                borderRadius:
                    BorderRadius.all(Radius.circular(radius ?? AppRadius.r6)),
              ),
              child: Center(
                  child: SvgPicture.asset(
                svgAssets.iconFilter,
                fit: BoxFit.scaleDown,
                colorFilter: ColorFilter.mode(
                    isThemeColorReturn(context), BlendMode.srcIn),
                height: Sizes.s20,
                width: Sizes.s20,
              )).paddingAll(Insets.i2)));
    });
  }
}
