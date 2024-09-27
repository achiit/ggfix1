import '../../../../config.dart';

class OnBoardingWidget {
  //animated container decoration
  BoxDecoration decor(context, currentPage, index) => BoxDecoration(
      borderRadius: BorderRadius.circular(AppRadius.r25),
      color: index == currentPage /*e.key == rotation.currentPage*/
          ? appColor(context).appTheme.whiteColor
          : appColor(context).appTheme.whiteColor.withOpacity(0.20));

  //round circle
  Positioned circlePosition(context, controller) => Positioned(
      bottom: MediaQuery.of(context).size.width * 0.09,
      top: MediaQuery.of(context).size.width * 0.1,
      right: MediaQuery.of(context).size.width * 0.1,
      left: MediaQuery.of(context).size.width * 0.07,
      child: RotationTransition(
          turns: controller, //rotation.controller!,
          child: SizedBox(
              height: MediaQuery.of(context).size.height * 1.0,
              width: MediaQuery.of(context).size.width * 1.0,
              child: ClipOval(
                  child: Image.asset(imageAssets.halfCircle,
                      fit: BoxFit.scaleDown)))));

  //bottom container text
  Row commonText(text, isStyle, context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(text,
                maxLines: 3,
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
                style: isStyle == true
                    ? appCss.dmPoppinsMedium22
                        .textColor(appColor(context).appTheme.whiteColor)
                    : appCss.dmPoppinsRegular14.textColor(
                        appColor(context).appTheme.txtTransparentColor)),
          ),
        ],
      );

  //image
  Image image(image) => Image.asset(
        image,
        fit: BoxFit.cover,
      );

  //bottom button decoration
  BoxDecoration decorButton(context) => BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(
          colors: [
            appColor(context).appTheme.whiteColor.withOpacity(0.34),
            appColor(context).appTheme.primaryColor
          ], // Gradient colors
          begin: Alignment.topRight,
          end: Alignment.bottomRight));

  //bottom circle color decoration
  BoxDecoration decorColor(color) =>
      BoxDecoration(shape: BoxShape.circle, color: color);

  //bottom text container decoration
  ShapeDecoration shapeDecor(context) => ShapeDecoration(
      shape: const RoundedRectangleBorder(),
      color: appColor(context).appTheme.transparentColor);
}
