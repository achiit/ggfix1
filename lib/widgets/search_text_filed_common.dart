import '../config.dart';
import 'package:fuzzy/plugin_list.dart';

class SearchTextFieldCommon extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextStyle? hintStyle;
  final String? hintText;
  final double? vertical, radius;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final Color? fillColor;

  const SearchTextFieldCommon({
    super.key,
    this.hintText,
    this.controller,
    this.prefixIcon,
    this.fillColor,
    this.vertical,
    this.suffixIcon,
    this.onChanged,
    this.radius,
    this.hintStyle,
    this.keyboardType,
    this.focusNode,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, theme, child) {
      //search text input field
      return TextFormField(
          validator: validator,
          keyboardType: keyboardType,
          focusNode: focusNode,
          decoration: InputDecoration(
              fillColor:
                  fillColor ?? appColor(context).appTheme.searchBackground,
              filled: true,
              isDense: true,
              //input border
              disabledBorder: CommonWidget().searchTextBorder(radius),
              focusedBorder: CommonWidget().searchTextBorder(radius),
              enabledBorder: CommonWidget().searchTextBorder(radius),
              border: CommonWidget().searchTextBorder(radius),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: Insets.i10, vertical: vertical ?? Insets.i10),
              prefixIcon: prefixIcon ??
                  //search icon svg
                  CommonWidget().searchIcon(svgAssets.iconSearch, context),
              hintStyle: hintStyle ??
                  appCss.dmPoppinsMedium14.textColor(isTheme(context)
                      ? appColor(context).appTheme.lightText.withOpacity(0.34)
                      : appColor(context)
                          .appTheme
                          .primaryColor
                          .withOpacity(0.34)),
              hintText: hintText ?? language(context, appFonts.searchHere)),
          controller: controller,
          onChanged: onChanged);
    });
  }
}
