import '../../../../config.dart';
import '../../../../plugin_list.dart';

class ShippingWidget {
  //add address button showdow decoration
  BoxDecoration decorShipping(context) => BoxDecoration(
          border: Border.all(
            width: Sizes.s1,
            color: appColor(context).appTheme.shadowWhiteColor,
          ),
          color: isThemeColorReturnDark(context),
          boxShadow: [
            BoxShadow(
                color: appColor(context).appTheme.shadowColorTwo,
                spreadRadius: 2,
                blurRadius: 8)
          ]);

//add address address type decoration
  BoxDecoration addressTypeDecor(context) => BoxDecoration(
      borderRadius: const BorderRadius.all(
        Radius.circular(AppRadius.r10),
      ),
      color: isTheme(context)
          ? appColor(context).appTheme.colorContainer
          : appColor(context).appTheme.searchBackground);

//common text name display
  Row textCommon(text, isStyle, context) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Text(text,
                style: (isStyle == true
                    ? appCss.dmPoppinsRegular14
                        .textColor(isThemeColorReturn(context))
                    : appCss.dmPoppinsMedium14
                        .textColor(isThemeColorReturn(context)))),
          ),
        ],
      );

//shipping details decoration
  BoxDecoration shippingDetailsDecor(shipping, index, context) => BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.r10),
          border: Border.all(
            width: Sizes.s1,
            color: shipping.selectIndex == index
                ? isTheme(context)
                    ? appColor(context).appTheme.lightText
                    : appColor(context).appTheme.primaryColor
                : isTheme(context)
                    ? appColor(context).appTheme.primaryColor
                    : appColor(context).appTheme.primaryColor.withOpacity(
                        0.07) /*appColor(context).appTheme.colorContainer*/,
          ),
          color: appColor(context).appTheme.colorContainer,
          boxShadow: [
            BoxShadow(
                color: appColor(context).appTheme.shadowColorThree,
                spreadRadius: 2,
                blurRadius: 8)
          ]);

//shipping details page button decoration
  Row buttonShippingDetails(context, shipping, index) => Row(children: [
        //edit button layout and click event
        CommonEditButton(
            imagePath: svgAssets.iconShippingEdit,
            onPressed: () => route.pushNamed(context, routeName.addNewAddress)),
        const HSpace(Sizes.s10),
        //delete button layout and click event
        CommonEditButton(
            imagePath: svgAssets.iconTrash,
            onPressed: () => shipping.removeAddress(index!))
      ]);

//divider
  SizedBox divider(context) => SizedBox(
      height: Sizes.s25,
      child: VerticalDivider(
        color: isTheme(context)
            ? appColor(context).appTheme.whiteColor.withOpacity(0.34)
            : appColor(context).appTheme.shadowColor,
        width: Sizes.s2,
      ));

//shipping option page container decor
  BoxDecoration shippingOptionDecor(context) => BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.r10),
        color: appColor(context).appTheme.backGroundColorMain,
      );

//shipping option page container decor
  Container shippingOptionContainer(context, data) => Container(
      height: Sizes.s28,
      width: Sizes.s28,
      decoration: BoxDecoration(
          color: isThemeColorReturn(context), shape: BoxShape.circle),
      child: SvgPicture.asset(
        data["icon"],
        fit: BoxFit.scaleDown,
        colorFilter:
            ColorFilter.mode(isThemeColorReturnDark(context), BlendMode.srcIn),
      ));

//add address appbar
  Widget appbarAddAddress(context) => CommonAppBar(
        appName: language(context, appFonts.addNewAddress),
        isIcon: true,
        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.20),
        onPressed: () => route.pop(context),
      ).paddingOnly(top: Insets.i10, bottom: Insets.i20);
}
