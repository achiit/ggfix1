import 'package:fuzzy/plugin_list.dart';

import '../../../../../config.dart';

class DetailsWidget {
  //details check delivery decoration
  BoxDecoration decorDetailsCheckDelivery(context) => BoxDecoration(
      borderRadius: BorderRadius.circular(AppRadius.r8),
      border: Border.all(
          width: Sizes.s1,
          color: appColor(context).appTheme.primaryColor.withOpacity(0.07)),
      color: appColor(context).appTheme.backGroundColorMain);

//svg icon
  SvgPicture svgImage(context, data) => SvgPicture.asset(data['icon'],
      colorFilter: ColorFilter.mode(
          appColor(context).appTheme.lightText, BlendMode.srcIn),
      fit: BoxFit.scaleDown);

//carousal image
  Align alignImage(index, data) => Align(
      alignment: index != 0.7 ? Alignment.bottomCenter : Alignment.topCenter,
      child: Image.asset(data, fit: BoxFit.cover));

//stepper decor
  BoxDecoration decorStepper(context) => BoxDecoration(
      borderRadius: BorderRadius.circular(AppRadius.r8),
      border: Border.all(
          width: Sizes.s1,
          color: appColor(context).appTheme.primaryColor.withOpacity(0.07)),
      boxShadow: [
        BoxShadow(
            color: appColor(context).appTheme.shadowColorFour,
            spreadRadius: 2,
            blurRadius: 8)
      ],
      color: appColor(context).appTheme.searchBackground);

//button decoration
  BoxDecoration decorationButton(context) => BoxDecoration(
      borderRadius: BorderRadius.circular(AppRadius.r10),
      color: isThemeButtonColorReturn(context));

//divider
  SizedBox divider(context) => SizedBox(
      height: Sizes.s15,
      child: VerticalDivider(
          color: isTheme(context)
              ? appColor(context).appTheme.colorContainer
              : appColor(context).appTheme.colorContainer.withOpacity(0.12),
          width: 1.5));

//stepper container on details page
  BoxDecoration stepperContainer(context) => BoxDecoration(
      borderRadius: BorderRadius.circular(AppRadius.r8),
      border: Border.all(
          width: Sizes.s1,
          color: appColor(context).appTheme.primaryColor.withOpacity(0.07)),
      boxShadow: [
        BoxShadow(
            color: appColor(context).appTheme.shadowColorFour,
            spreadRadius: 2,
            blurRadius: 8)
      ],
      color: appColor(context).appTheme.searchBackground);

  //stepper vertical divider
  SizedBox verticalDivider(context) => SizedBox(
      height: Sizes.s15,
      //vertical divider
      child: VerticalDivider(
          color: appColor(context).appTheme.lightText, width: Sizes.s2));

  //decoration of details 2 page top title name
  BoxDecoration decorationTopContainer(context) => BoxDecoration(
      borderRadius: BorderRadius.circular(AppRadius.r8),
      border: Border.all(
          width: Sizes.s1,
          color: appColor(context).appTheme.primaryColor.withOpacity(0.07)),
      color: appColor(context).appTheme.searchBackground);

//divider
  Divider commonDivider(context) => Divider(
        height: Sizes.s1,
        color: appColor(context).appTheme.primaryColor.withOpacity(0.09),
      );

//writeReview text
  Column writeReview(context, details) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //click event for the open write review layout
          Text(language(context, appFonts.writeReview),
                  style: appCss.dmPoppinsMedium14
                      .textColor(isThemeColorReturn(context)))
              .inkWell(onTap: () => details.onShowBottomLayout(context)),
          const VSpace(Sizes.s10),
        ],
      );

//carousel Image details
  Positioned carouselImage(index, data) => Positioned.fill(
      child: Opacity(
          opacity: index ? 1.0 : 0.5,
          child: Image.asset(data, fit: BoxFit.cover)));

//check delivery textfield
  Stack checkDeliveryTextField(context) => Stack(children: [
        CommonTextFieldAddress(
            //controller:,
            //validator: ,
            fillColor: appColor(context).appTheme.whiteColor,
            height: Sizes.s40,
            vertical: Insets.i8,
            hintText: language(context, appFonts.pinCode),
            hintStyle: appCss.dmPoppinsRegular14
                .textColor(appColor(context).appTheme.lightText)),
        //align set
        CommonWidget().topAlign(
            context,
            //button
            ButtonCommon(
                height: Sizes.s40,
                width: Sizes.s98,
                color: isThemeButtonColorReturn(context),
                title: language(context, appFonts.check),
                radius: AppRadius.r8,
                style: appCss.dmPoppinsMedium14
                    .textColor(isThemeColorReturnDark(context))))
      ]);

  //table cell in dimension data
  Text tableText(context, title) => Text(language(context, title),
      style: appCss.dmPoppinsMedium14.textColor(isThemeColorReturn(context)));

//table header text
  Text tableHeaderText(context, title) => Text(language(context, title),
      style: appCss.dmPoppinsRegular12
          .textColor(appColor(context).appTheme.lightText));
}
