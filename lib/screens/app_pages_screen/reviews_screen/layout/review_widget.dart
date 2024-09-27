import '../../../../config.dart';
import '../../../../plugin_list.dart';

class ReviewWidget{

  //write review decor
  BoxDecoration decoration(context) => BoxDecoration(
      color: appColor(context).appTheme.backGroundColorMain,
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(AppRadius.r20),
          topLeft: Radius.circular(AppRadius.r20)));

//write review page border
  DottedBorder writeReviewBorder(context, widget) => DottedBorder(
      color: appColor(context).appTheme.lightText,
      strokeWidth: Sizes.s1,
      borderType: BorderType.RRect,
      radius: const Radius.circular(AppRadius.r10),
      child: widget);

  //upload design
  SizedBox iconTextIncrement(context)=> SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //svg icon
            CommonWidget()
                .svgAssets(context, svgAssets.iconIncrement),
            Text(language(context, appFonts.upload),
                style: (appCss.dmPoppinsRegular14
                    .textColor(isThemeColorReturn(context))),
                textAlign: TextAlign.center)
          ]));
}