import '../config.dart';
import '../plugin_list.dart';

class CommonWidget {
//svg image display
  SvgPicture svgAssets(context, image) => SvgPicture.asset(image,
      fit: BoxFit.scaleDown,
      colorFilter:
          ColorFilter.mode(isThemeColorReturn(context), BlendMode.srcIn));

//svg image display different color return
  SvgPicture svgAssetsOne(context, image) => SvgPicture.asset(image,
      fit: BoxFit.scaleDown,
      colorFilter:
          ColorFilter.mode(isThemeColorReturnDark(context), BlendMode.srcIn));

  //Box Decoration
  BoxDecoration decor(context) => BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r10)),
      color: appColor(context).appTheme.searchBackground);

  //login and registration comman text
  Column commonTextLoginRegistration(context) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        VSpace(MediaQuery.of(context).size.height * 0.22),
        Text(language(context, appFonts.letsYou),
            style: TextStyle(
                fontFamily: 'Optima LT',
                color: appColor(context).appTheme.whiteColor,
                fontSize: FontSizes.f22)),
        const VSpace(Sizes.s10),
        //text layout
        CommonTextLayout(text: language(context, appFonts.letsYouOne)),
        const VSpace(Sizes.s30)
      ]);

  //svg image password
  SvgPicture passwordSVG(login, imageHide, imageOpen) =>
      SvgPicture.asset(login ? imageHide : imageOpen, fit: BoxFit.scaleDown);

  //color filter
  ColorFilter colorFilter(context) =>
      ColorFilter.mode(isThemeColorReturn(context), BlendMode.srcIn);

  //filter
  Widget filterLayout(category, context) => Row(children: [
        Expanded(
            flex: 5,
            child: SizedBox(
                height: Sizes.s48,
                //text filed
                child: SearchTextFieldCommon(
                    controller: category /*category.searchCtrl*/))),
        const HSpace(Sizes.s12),
        Expanded(
            flex: 0,
            child: FilterIconCommon(
                onPressed: () =>
                    route.pushNamed(context, routeName.filterData)))
      ]);

//stepper decor
  BoxDecoration stepperDecor(context) => BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r15)),
      color: appColor(context).appTheme.whiteColor);

  //stepper decor circle
  BoxDecoration circleDecor(context, color) =>
      BoxDecoration(shape: BoxShape.circle, color: color);

  //align set top
  Align topAlign(context, widget) => Align(
      alignment: isDirectionRTL(context) || isAr(context)
          ? Alignment.topLeft
          : Alignment.topRight,
      child: widget);

//align set bottom
  Align bottomAlign(context, widget) => Align(
      alignment: isDirectionRTL(context) || isAr(context)
          ? Alignment.bottomLeft
          : Alignment.bottomRight,
      child: widget);

  //page list decor
  BoxDecoration decorPageList(context) => BoxDecoration(
      color: isTheme(context)
          ? appColor(context).appTheme.colorContainer
          : appColor(context).appTheme.searchBackground,
      borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r8)));

  //decor setting
  BoxDecoration decorSetting(context) => BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.r10),
          border: Border.all(
              width: Sizes.s1,
              color: appColor(context).appTheme.primaryColor.withOpacity(0.07)),
          color: isTheme(context)
              ? appColor(context).appTheme.colorContainer
              : appColor(context).appTheme.whiteColor,
          boxShadow: [
            BoxShadow(
                color: appColor(context).appTheme.shadowColorThree,
                spreadRadius: 2,
                blurRadius: 8)
          ]);

  //svg image theme wise change
  SvgPicture svgImage(context, image, imageOne) => SvgPicture.asset(
      isDirectionRTL(context) || isAr(context) ? image : imageOne,
      colorFilter:
          ColorFilter.mode(isThemeColorReturn(context), BlendMode.srcIn));

//rating bar
  RatingBar ratingBar() => RatingBar.builder(
      initialRating: 5,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: Sizes.s11,
      itemBuilder: (context, _) => Icon(Icons.star,
          color: appColor(context)
              .appTheme
              .yellowColor // Adjust the size as needed
          ),
      onRatingUpdate: (rating) {});

  //common appbar button decor
  BoxDecoration commonAppbarDecor(context, colorContainer) => BoxDecoration(
          color: colorContainer ?? isThemeColorReturnDark(context),
          shape: BoxShape.circle,
          border: Border.all(
            color: appColor(context).appTheme.primaryColor.withOpacity(0.1),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
                color: appColor(context).appTheme.shadowColorThree,
                spreadRadius: 2,
                blurRadius: 8)
          ]);

//divider
  Divider commonDivider(context) => Divider(
        height: Sizes.s1,
        color: isTheme(context)
            ? appColor(context).appTheme.transparentColor
            : appColor(context).appTheme.shadowColor,
      );

  //empty page layout container

  Container emptyContainer(context, height, width, imagePath) => Container(
      height: height,
      width: width,
      color: isTheme(context)
          ? appColor(context).appTheme.colorContainer
          : appColor(context).appTheme.whiteColor,
      child: Image.asset(imagePath, fit: BoxFit.fitHeight));

//textfield address
  BoxDecoration addressTextField(context, fillColor) => BoxDecoration(
          color: fillColor ??
              (isTheme(context)
                  ? appColor(context).appTheme.colorContainer
                  : appColor(context).appTheme.whiteColor),
          border: Border.all(
              width: Sizes.s1,
              color: appColor(context).appTheme.primaryColor.withOpacity(0.07)),
          borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r8)),
          boxShadow: [
            BoxShadow(
                color: appColor(context).appTheme.shadowColorFour,
                spreadRadius: 2,
                blurRadius: 8)
          ]);

//Outline border in address textfield

  OutlineInputBorder inputBorder(radius) => OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(radius ?? AppRadius.r8)),
      borderSide: BorderSide.none);

//search textfield input border

  OutlineInputBorder searchTextBorder(radius) => OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(radius ?? AppRadius.r6)),
      borderSide: BorderSide.none);

//search icon
  SvgPicture searchIcon(image, context) => SvgPicture.asset(image,
      fit: BoxFit.scaleDown,
      colorFilter: ColorFilter.mode(
          isTheme(context)
              ? appColor(context).appTheme.lightText
              : appColor(context).appTheme.primaryColor,
          BlendMode.srcIn));

  //text field decoration

  BoxDecoration textFieldDecor(radius, context) => BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(radius ?? AppRadius.r4),
          topLeft: Radius.circular(radius ?? AppRadius.r4),
        ),
        border: Border(
          left: BorderSide(
              width: Sizes.s3,
              color: appColor(context).appTheme.btnPrimaryColor),
        ),
      );

//outline input border textfield

  OutlineInputBorder inputBorderTextField(radius) => OutlineInputBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(radius ?? AppRadius.r4),
          topRight: Radius.circular(radius ?? AppRadius.r4),
        ),
        borderSide: BorderSide.none,
      );

//textfield common decoration

  InputDecoration textfieldInputDecoration(counterText, fillColor, context,
          radius, suffixIcon, prefixIcon, hintStyle, hintText) =>
      InputDecoration(
        counterText: counterText,
        fillColor: fillColor ?? appColor(context).appTheme.txtColor,
        filled: true,
        isDense: true,
        //input border
        disabledBorder: CommonWidget().inputBorderTextField(radius),
        focusedBorder: CommonWidget().inputBorderTextField(radius),
        enabledBorder: CommonWidget().inputBorderTextField(radius),
        border: CommonWidget().inputBorderTextField(radius),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: Insets.i10,
          vertical: Insets.i15,
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintStyle: hintStyle ??
            appCss.dmPoppinsMedium14.textColor(
              appColor(context).appTheme.txtTransparentColor,
            ),
        hintText: hintText,
      );
}
