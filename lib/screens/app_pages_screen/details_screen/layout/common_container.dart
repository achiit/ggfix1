import '../../../../config.dart';

class CommonContainer extends StatelessWidget {
  final Widget? widget;
  final double? height;
  const CommonContainer({super.key, this.widget, this.height});

  @override
  Widget build(BuildContext context) {
    //common container
    return Container(
      width: MediaQuery.of(context).size.width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.r8),
          color: appColor(context).appTheme.colorContainer),
      child: widget,
    );
  }
}
