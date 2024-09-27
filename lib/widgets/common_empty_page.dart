import 'package:fuzzy/plugin_list.dart';

import '../config.dart';

class CommonEmptyPage extends StatelessWidget {
  final String appName;
  final String text, textDescription;
  final String imagePath;
  final GestureTapCallback? onTap;
  final String btnTitle;
  final bool? isVisible;
  final double? height, width;

  const CommonEmptyPage(
      {super.key,
      required this.appName,
      required this.imagePath,
      required this.text,
      required this.textDescription,
      required this.btnTitle,
      this.onTap,
      this.isVisible = true,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, theme, child) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //appbar
            CommonAppBar(
                    appName: appName,
                    onPressed: () => route.pop(context),
                    isIcon: true)
                .paddingOnly(top: Insets.i10),
            //container
            CommonWidget().emptyContainer(context, height, width, imagePath),
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(text,
                      style: appCss.dmPoppinsMedium18
                          .textColor(isThemeColorReturn(context))),
                  const VSpace(Sizes.s8),
                  Text(textDescription,
                          style: appCss.dmPoppinsRegular14
                              .textColor(appColor(context).appTheme.lightText),
                          textAlign: TextAlign.center)
                      .paddingSymmetric(horizontal: Insets.i20),
                  const VSpace(Sizes.s40),
                  isVisible == false
                      ? const VSpace(Sizes.s40)
                      //button
                      : ButtonCommon(
                          title: btnTitle,
                          width: MediaQuery.of(context).size.width,
                          height: Sizes.s52,
                          color: isThemeButtonColorReturn(context),
                          style: appCss.dmPoppinsRegular16
                              .textColor(isThemeColorReturnDark(context)),
                          radius: AppRadius.r10,
                          onTap: onTap)
                ])
          ]).paddingOnly(
          left: Insets.i20, right: Insets.i20, bottom: Insets.i120);
    });
  }
}
