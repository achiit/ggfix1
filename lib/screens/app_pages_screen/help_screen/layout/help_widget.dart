import '../../../../config.dart';

class HelpWidget {
  //sublist text
  Column subLayoutList(context, subtitle) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(language(context, subtitle),
            style: appCss.dmPoppinsRegular12
                .textColor(appColor(context).appTheme.lightText)),
        const VSpace(Sizes.s5)
      ]);

//decor main list
  BoxDecoration decor(context) => BoxDecoration(
      borderRadius: BorderRadius.circular(AppRadius.r4),
      color: appColor(context).appTheme.searchBackground);
}
