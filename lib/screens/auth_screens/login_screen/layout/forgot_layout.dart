import '../../../../config.dart';
import 'package:fuzzy/plugin_list.dart';

class ForgotLayout extends StatelessWidget {
  const ForgotLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context1, login, child) {
      return Stack(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(children: [
            Container(
              height: Sizes.s20,
              width: Sizes.s20,
              //decoration
              decoration: LoginWidget().decor(context),
              child: login.checkedValue
                  //svg icon
                  ? SvgPicture.asset(svgAssets.iconCheck)
                  : null,
            ).inkWell(onTap: () => login.checkedValue = login.isCheck()),
            //text
            Text(language(context, appFonts.rememberMe),
                    style: appCss.dmPoppinsRegular12.textColor(
                        appColor(context).appTheme.txtTransparentColor))
                .paddingSymmetric(horizontal: Insets.i8)
          ]),
          //text layout
          Text(language(context, appFonts.forgotPassword),
                  overflow: TextOverflow.ellipsis,
                  style: appCss.dmPoppinsRegular12
                      .textColor(appColor(context).appTheme.linkErrorColor))
              .inkWell(onTap: () => route.pushNamed(context, routeName.forgot))
        ])
      ]);
    });
  }
}
