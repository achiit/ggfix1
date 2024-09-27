import '../../../../config.dart';

class LanguageWidget {
  //radio button decor
  BoxDecoration decor(context) => BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: appColor(context).appTheme.primaryColor),
      color: appColor(context).appTheme.whiteColor);

//Radio button border decor
  BoxDecoration decorWithOutColor(context) => BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: appColor(context).appTheme.primaryColor));
}
