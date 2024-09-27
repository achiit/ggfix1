import '../../../../config.dart';
import 'package:fuzzy/plugin_list.dart';

class TextFieldLayout extends StatelessWidget {
  const TextFieldLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context1, login, child) {
      return Stack(children: [
        Column(children: [
          //text layout
          CommonTextLayout(
              text: language(context, appFonts.email), isStyle: true),
          const VSpace(Sizes.s6),
          //text filed
          TextFieldCommon(
              keyboardType: TextInputType.emailAddress,
              focusNode: login.emailFocus,
              controller: login.emailController,
              hintText: language(context, appFonts.hintEmail),
              prefixIcon:
                  SvgPicture.asset(svgAssets.iconEmail, fit: BoxFit.scaleDown),
              /*validator: (value) =>
                  Validation().emailValidation(context, value)*/),
          const VSpace(Sizes.s15),
          //text layout
          CommonTextLayout(
              text: language(context, appFonts.password), isStyle: true),
          const VSpace(Sizes.s6),
          //text filed
          TextFieldCommon(
              controller: login.passwordController,
              keyboardType: TextInputType.text,
              focusNode: login.passwordFocus,
              hintText: language(context, appFonts.hintPassword),
              obscureText: login.isNewPassword,
              prefixIcon:
                  SvgPicture.asset(svgAssets.iconLock, fit: BoxFit.scaleDown),
              suffixIcon: CommonWidget()
                  .passwordSVG(login.isNewPassword, svgAssets.iconHide,
                      svgAssets.iconEye)
                  .inkWell(onTap: () => login.newPasswordSeenTap()),
              /*validator: (value) => validation.passValidation(context, value)*/),
          const VSpace(Sizes.s15),
          //forgot link and remember me layout
          const ForgotLayout()
        ])
      ]);
    });
  }
}
