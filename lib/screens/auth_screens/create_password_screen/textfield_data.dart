import '../../../config.dart';
import 'package:fuzzy/plugin_list.dart';

class CreatePasswordTextField extends StatelessWidget {
  const CreatePasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CreatePasswordProvider>(
        builder: (context1, changepassword, child) {
      return Stack(children: [
        Column(children: [
          //text layout
          CommonTextLayout(
              text: language(context, appFonts.password), isStyle: true),
          const VSpace(Sizes.s6),
          //text filed
          TextFieldCommon(
            controller: changepassword.passwordController,
            keyboardType: TextInputType.text,
            focusNode: changepassword.passwordFocus,
            hintText: language(context, appFonts.hintPassword),
            obscureText: changepassword.isNewPassword,
            prefixIcon:
                SvgPicture.asset(svgAssets.iconLock, fit: BoxFit.scaleDown),
            suffixIcon: CommonWidget()
                .passwordSVG(changepassword.isNewPassword, svgAssets.iconHide,
                    svgAssets.iconEye)
                .inkWell(
                    onTap: () => changepassword
                        .newPasswordSeenTap()), /*validator: (value) => validation.passValidation(context, value)*/
          ),
          const VSpace(Sizes.s15),
          //text layout
          CommonTextLayout(
              text: language(context, appFonts.confirmPassword), isStyle: true),
          const VSpace(Sizes.s6),
          //text filed
          TextFieldCommon(
            controller: changepassword.confirmPasswordController,
            keyboardType: TextInputType.text,
            focusNode: changepassword.changePasswordFocus,
            hintText: language(context, appFonts.hintConfirmPassword),
            obscureText: changepassword.isConfirmPassword,
            prefixIcon:
                SvgPicture.asset(svgAssets.iconLock, fit: BoxFit.scaleDown),
            suffixIcon: CommonWidget()
                .passwordSVG(changepassword.isConfirmPassword,
                    svgAssets.iconHide, svgAssets.iconEye)
                .inkWell(onTap: () => changepassword.confirmPasswordSeenTap()),
            /*validator: (value) => validation.confirmPassValidation(
                  context, value, changepassword.passwordController.text)*/
          )
        ])
      ]);
    });
  }
}
