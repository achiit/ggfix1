import '../config.dart';
import '../plugin_list.dart';

class CommonWishlistButton extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color? containerColor;
  final Color? shadowColor;
  final GestureTapCallback? onTap;
  final double? spreadRadius;
  final double? blurRadius;
  final String imagePath;
  final AlignmentGeometry? alignment;

  const CommonWishlistButton({
    this.margin,
    this.padding,
    this.containerColor,
    this.shadowColor,
    this.spreadRadius,
    this.blurRadius,
    super.key,
    required this.imagePath,
    this.alignment,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeService, DirectionProvider>(
        builder: (context1, theme, direction, child) {
          //wishlist button
      return GestureDetector(
        onTap: onTap,
        //top align set
        child: CommonWidget().topAlign(
            context,
            Container(
                    margin: margin ??
                        EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.02),
                    padding: padding ?? const EdgeInsets.all(Insets.i4),
                    decoration: BoxDecoration(
                      color: containerColor ?? isTheme(context)
                          ? appColor(context).appTheme.primaryColor
                          : appColor(context).appTheme.whiteColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: shadowColor ?? isTheme(context)
                              ? appColor(context).appTheme.primaryColor
                              : appColor(context)
                                  .appTheme
                                  .primaryColor
                                  .withOpacity(0.10),
                          spreadRadius:
                              spreadRadius ?? isTheme(context) ? 0 : 2,
                          blurRadius: blurRadius ?? isTheme(context) ? 0 : 8,
                        ),
                      ],
                    ),
                    child: SvgPicture.asset(imagePath))
                .paddingSymmetric(horizontal: Insets.i15)),
      );
    });
  }
}
