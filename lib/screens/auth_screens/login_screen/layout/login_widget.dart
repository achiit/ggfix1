import 'package:fuzzy/plugin_list.dart';
import '../../../../config.dart';

class LoginWidget {
  //social login decor
  Container socialLogin(context, imagePath) => Container(
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
            color: appColor(context).appTheme.txtColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(AppRadius.r6),
            )),
        child: Center(
            child: SvgPicture.asset(
          imagePath,
          width: Sizes.s34,
          height: Sizes.s34,
          fit: BoxFit.contain,
        ).paddingSymmetric(vertical: Insets.i15)),
      );

  BoxDecoration decor(context) => BoxDecoration(
      borderRadius: BorderRadius.circular(Sizes.s6),
      color: appColor(context).appTheme.txtColor);
}
