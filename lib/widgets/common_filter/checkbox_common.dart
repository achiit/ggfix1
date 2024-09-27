import '../../config.dart';

class CheckBoxCommon extends StatelessWidget {
  final bool? isCheck;
  final GestureTapCallback? onTap;
  const CheckBoxCommon({super.key, this.isCheck = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    //checkbox layout
    return Container(
            height: Sizes.s20,
            width: Sizes.s20,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: isCheck == true
                    ? appColor(context).appTheme.primaryColor
                    : appColor(context).appTheme.whiteColor,
                borderRadius: BorderRadius.circular(AppRadius.r4),
                border: Border.all(
                    color: isCheck == true
                        ? appColor(context).appTheme.transparentColor
                        : appColor(context).appTheme.transparentColor)),
            child: isCheck == true
                ? Icon(Icons.check,
                    size: Sizes.s15,
                    color: appColor(context).appTheme.whiteColor)
                : null)
        .inkWell(onTap: onTap);
  }
}
