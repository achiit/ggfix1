import '../config.dart';
import '../plugin_list.dart';

class CommonEditButton extends StatelessWidget {
  final String imagePath; // Path to your image asset
  final VoidCallback onPressed;
  const CommonEditButton(
      {super.key, required this.imagePath, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    //button layout
    return GestureDetector(
        onTap: onPressed,
        child: Container(
            height: Sizes.s28,
            width: Sizes.s28,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppRadius.r6),
                border: Border.all(
                  width: Sizes.s1,
                  color: appColor(context).appTheme.primaryColor.withOpacity(0.07),
                ),
                color: appColor(context).appTheme.whiteColor,
                boxShadow:  [
                  BoxShadow(
                      color: appColor(context).appTheme.shadowColorThree,
                      spreadRadius: 2,
                      blurRadius: 8)
                ]),
            child: SvgPicture.asset(imagePath).paddingAll(Insets.i5)));
  }
}
