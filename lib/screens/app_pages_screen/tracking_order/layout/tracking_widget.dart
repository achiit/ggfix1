import 'package:fuzzy/plugin_list.dart';

import '../../../../config.dart';

class TrackingWidget {
  //decoration tracking
  BoxDecoration decorTracking(context, data) => BoxDecoration(
      color: data['isActive'] == true
          ? isTheme(context)
              ? appColor(context).appTheme.whiteColor.withOpacity(0.15)
              : appColor(context).appTheme.primaryColor.withOpacity(0.15)
          : data['isReadyActive'] == true
              ? isTheme(context)
                  ? appColor(context).appTheme.whiteColor.withOpacity(0.15)
                  : appColor(context).appTheme.primaryColor.withOpacity(0.15)
              : isTheme(context)
                  ? appColor(context).appTheme.primaryColor.withOpacity(0.15)
                  : appColor(context).appTheme.shadowWhiteColor,
      shape: BoxShape.circle);

//active tracking decor
  BoxDecoration decorTrackingActive(context, data) => BoxDecoration(
      color: data['isActive'] == true
          ? isTheme(context)
              ? appColor(context).appTheme.whiteColor.withOpacity(0.15)
              : appColor(context).appTheme.primaryColor.withOpacity(0.15)
          : isTheme(context)
              ? appColor(context).appTheme.whiteColor.withOpacity(0.15)
              : appColor(context).appTheme.whiteColor,
      shape: BoxShape.circle);

//svg image icon tracking
  SvgPicture svgPicture(context, data) => SvgPicture.asset(data['icon'],
      colorFilter: ColorFilter.mode(
          data['isActive'] == true
              ? isThemeColorReturnDark(context)
              : data['isReadyActive'] == true
                  ? isThemeColorReturn(context)
                  : appColor(context).appTheme.lightText,
          BlendMode.srcIn));

//tracking container decor
  BoxDecoration trackingDecor(context) => BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r10)),
      color: isTheme(context)
          ? appColor(context).appTheme.colorContainer
          : appColor(context).appTheme.searchBackground);
}
