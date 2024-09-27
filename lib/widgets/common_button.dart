import '../config.dart';

class ButtonCommon extends StatelessWidget {
  final String title;
  final double? padding, margin, radius, height, fontSize, width;
  final GestureTapCallback? onTap;
  final TextStyle? style;
  final Color? color, fontColor, borderColor;
  final Widget? icon;
  final FontWeight? fontWeight;

  const ButtonCommon(
      {Key? key,
      required this.title,
      this.padding,
      this.margin = 0,
      this.radius = AppRadius.r8,
      this.height = 50,
      this.fontSize = FontSizes.f30,
      this.onTap,
      this.style,
      this.color,
      this.fontColor,
      this.icon,
      this.borderColor,
      this.width,
      this.fontWeight = FontWeight.w700})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //common button layout
    return Container(
        width: width ?? MediaQuery.of(context).size.width * 1.0,
        height: height ?? MediaQuery.of(context).size.height * 0.06,
        margin: EdgeInsets.symmetric(horizontal: margin!),
        decoration: BoxDecoration(
          color: color ?? appColor(context).appTheme.btnPrimaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(radius ?? AppRadius.r6),
          ),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(title,
              textAlign: TextAlign.center,
              style: style ??
                  appCss.dmPoppinsBold14
                      .textColor(appColor(context).appTheme.primaryColor)),
          if (icon != null)
            Row(children: [
              icon ?? const HSpace(Sizes.s0),
              const HSpace(Sizes.s10)
            ]).paddingOnly(left: Insets.i8),
        ])).inkWell(onTap: onTap);
  }
}
