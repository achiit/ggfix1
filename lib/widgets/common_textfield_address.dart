import 'package:fuzzy/plugin_list.dart';
import '../config.dart';

class CommonTextFieldAddress extends StatelessWidget {
  final String hintText;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final Color? fillColor;
  final double? vertical, radius;
  final InputBorder? border;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final String? counterText;
  final TextStyle? hintStyle;
  final double? width;
  final double? height;

  const CommonTextFieldAddress({
    super.key,
    required this.hintText,
    this.validator,
    this.controller,
    this.fillColor,
    this.radius,
    this.border,
    this.keyboardType,
    this.focusNode,
    this.hintStyle,
    this.width,
    this.height,
    this.vertical,
    this.onChanged,
    this.counterText,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, theme, child) {
      return Container(
          height: height,
          //decoration box input
          decoration: CommonWidget().addressTextField(context, fillColor),
          child: TextFormField(
              style: appCss.dmPoppinsRegular14
                  .textColor(appColor(context).appTheme.primaryColor),
              focusNode: focusNode,
              keyboardType: keyboardType,
              validator: validator,
              controller: controller,
              onChanged: onChanged,
              decoration: InputDecoration(
                counterText: counterText,
                fillColor: appColor(context).appTheme.whiteColor,
                //border widget
                disabledBorder: CommonWidget().inputBorder(radius),
                focusedBorder: CommonWidget().inputBorder(radius),
                enabledBorder: CommonWidget().inputBorder(radius),
                border: CommonWidget().inputBorder(radius),
                contentPadding: EdgeInsets.symmetric(
                    horizontal: Insets.i10, vertical: vertical ?? Insets.i15),
                hintStyle: appCss.dmPoppinsRegular14
                    .textColor(appColor(context).appTheme.lightText),
                hintText: hintText,
              )));
    });
  }
}
