import '../../../../config.dart';
import '../../../../plugin_list.dart';

class DetailsCheckDeliverySubLayout extends StatelessWidget {
  final int index;
  final dynamic data;

  const DetailsCheckDeliverySubLayout(
      {super.key, this.data, required this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context1, theme, child) {
      return Row(children: [
        //svg image
        CommonWidget().svgAssets(context, data['icon']),
        const HSpace(Sizes.s8),
        //title
        Text(language(context, data['title']),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: appCss.dmPoppinsRegular12
                .textColor(isThemeColorReturn(context))),
        if (index != appArray.checkDeliveryList.length - 1)
          //divider
          Container(
            padding: const EdgeInsets.symmetric(horizontal: Insets.i12),
            height: Sizes.s32,
            child: VerticalDivider(
                color: isTheme(context)
                    ? appColor(context).appTheme.primaryColor
                    : appColor(context).appTheme.primaryColor.withOpacity(0.07),
                width: Sizes.s1),
          )
      ]);
    });
  }
}
