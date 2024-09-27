import '../../config.dart';

class CommonRadio extends StatelessWidget {
  final int? index, selectedIndex;
  final GestureTapCallback? onTap;
  const CommonRadio({super.key, this.onTap, this.index, this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    //radio button layout
    return Container(
            width: Sizes.s20,
            height: Sizes.s20,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: index == selectedIndex
                        ? appColor(context).appTheme.primaryColor
                        : appColor(context).appTheme.lightText),
                color: index == selectedIndex
                    ? appColor(context).appTheme.whiteColor
                    : appColor(context).appTheme.whiteColor),
            child: index == selectedIndex
                ? Icon(Icons.circle,
                    color: appColor(context).appTheme.primaryColor, size: Sizes.s13)
                : null)
        .inkWell(onTap: onTap);
  }
}
