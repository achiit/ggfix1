import '../../../../config.dart';
import '../../../../plugin_list.dart';

class CommonGridLayout extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;
  const CommonGridLayout(
      {super.key, required this.imagePath, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      //direction layout
      child:Directionality(
        textDirection: TextDirection.ltr,
        child: Stack(children: [
          SizedBox(
              width: MediaQuery.of(context).size.width *0.44,
              child: Image.asset(imagePath,fit: BoxFit.fill,)).paddingAll(Insets.i5),
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VSpace(Sizes.s15),
                Text(language(context, appFonts.chairNameOneGrid),
                    style: appCss.dmPoppinsSemiBold15
                        .textColor(appColor(context).appTheme.whiteColor)),
                VSpace(MediaQuery.of(context).size.height * 0.07),
                //svg icon
                SvgPicture.asset(svgAssets.iconHomeArrow),
                VSpace(MediaQuery.of(context).size.height * 0.01),
                Text(language(context, appFonts.viewMore),
                    style: appCss.dmPoppinsMedium10
                        .textColor(appColor(context).appTheme.whiteColor))
              ]).paddingSymmetric(horizontal: Insets.i15),
        ]),
      ),
    );
  }
}
