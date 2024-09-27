import '../../../../config.dart';
import 'package:fuzzy/plugin_list.dart';

class CommonAppbarButtonDetails extends StatelessWidget {
  final String imagePath; // Path to your image asset
  final GestureTapCallback? onTap;
  final Color? color;
  final Color? colorSvg;

  const CommonAppbarButtonDetails(
      {super.key,
      required this.imagePath,
      required this.onTap,
      this.color,
      this.colorSvg});

  @override
  Widget build(BuildContext context) {
    //appbar button
    return GestureDetector(
        onTap: onTap,
        child: Container(
            height: Sizes.s40,
            width: Sizes.s40,
            decoration: BoxDecoration(
              color: color ??
                  appColor(context).appTheme.colorContainer.withOpacity(0.15),
              borderRadius: BorderRadius.circular(AppRadius.r20),
              border: Border.all(
                  color: appColor(context)
                      .appTheme
                      .primaryColor
                      .withOpacity(0.10)),
              boxShadow: [
                BoxShadow(
                    color: appColor(context)
                        .appTheme
                        .primaryColor
                        .withOpacity(0.05),
                    spreadRadius: 2,
                    blurRadius: 8),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Center(
                  child: SvgPicture.asset(imagePath,
                      fit: BoxFit.scaleDown,
                      height: Sizes.s20,
                      width: Sizes.s20,
                      colorFilter: ColorFilter.mode(
                          colorSvg ?? appColor(context).appTheme.whiteColor,
                          BlendMode.srcIn))),
            )));
  }
}
