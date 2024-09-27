import '../../../../config.dart';

class CartWidget {
  //image container decoration
  BoxDecoration decor(context) => BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r8)),
      color: appColor(context).appTheme.colorContainer);

//color decoration
  BoxDecoration colorDecor(context) => BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r13)),
      color: appColor(context).appTheme.colorText);

//button decor
  BoxDecoration buttonDecor(context) =>
      BoxDecoration(color: isThemeColorReturnDark(context), boxShadow: [
        BoxShadow(
            color: appColor(context).appTheme.shadowColorTwo,
            spreadRadius: 2,
            blurRadius: 8)
      ]);
}
