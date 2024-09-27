import 'package:fuzzy/config.dart';

class TermsConditionWidget {
  //common sub text
  Text commonText(context, text) => Text(language(context, text),
      style: appCss.dmPoppinsRegular12
          .textColor(appColor(context).appTheme.lightText));

//divider
  Divider commonDivider(context) => Divider(
        height: Sizes.s1,
        color: isTheme(context)
            ? appColor(context).appTheme.transparentColor
            : appColor(context).appTheme.shadowColorFive,
      );

//common main text
  Text commonMainText(context, text) => Text(language(context, text),
      style: appCss.dmPoppinsSemiBold14.textColor(isThemeColorReturn(context)));

//sub text list data text
  Column subList(context, subData) => Column(
        children: [
          TermsConditionWidget().commonText(context, subData['title']),
          const VSpace(Sizes.s8),
        ],
      );
}
