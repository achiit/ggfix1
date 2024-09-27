import '../../../../config.dart';
import '../../../../plugin_list.dart';

class RichTextLayoutLogin extends StatelessWidget {
  const RichTextLayoutLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context1, login, child) {
      return Stack(children: [
        Column(children: [
          //integration layout
          // Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          //   //facebook integration
          //   LoginWidget()
          //       .socialLogin(context, svgAssets.iconFacebook)
          //       .inkWell(onTap: () =>login.onLogin(context)),
          //   //google integration
          //   LoginWidget()
          //       .socialLogin(context, svgAssets.iconGoogle)
          //       .inkWell(onTap: () => login.onLogin(context)),
          //   //apple integration
          //   LoginWidget()
          //       .socialLogin(context, svgAssets.iconApple)
          //       .inkWell(onTap: () => login.onLogin(context)),
          // ]),
          //sign up click event
          CommonAuthRichText(
            text: language(context, appFonts.accountCreate),
            subtext: language(context, appFonts.signUp),
            onTap: () => route.pushNamed(context, routeName.registration),
          ).paddingSymmetric(vertical: Insets.i30),
        ])
      ]);
    });
  }
}
