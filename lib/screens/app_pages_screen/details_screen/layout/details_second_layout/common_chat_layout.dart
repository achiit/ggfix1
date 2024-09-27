import '../../../../../config.dart';
import '../../../../../plugin_list.dart';

class CommonChatLayout extends StatelessWidget {
  const CommonChatLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      const VSpace(Sizes.s8),
      //details page rating chart row
      chartRow(context, '5', '21,856', 100),
      chartRow(context, '4', '3,457', 75),
      chartRow(context, '3', '500', 55),
      chartRow(context, '2', '277', 35),
      chartRow(context, ' 1', '139', 5),
      const VSpace(Sizes.s8)
    ]);
  }

//details page rating chart row
  Widget chartRow(BuildContext context, String label, String pct, int pc) {
    bool isVisible = false;
    return Row(children: [
      Text(label,
          textAlign: TextAlign.center,
          style:
              appCss.dmPoppinsRegular12.textColor(isThemeColorReturn(context))),
      const HSpace(Sizes.s6),
      Icon(Icons.star,
          color: appColor(context).appTheme.yellowColor, size: Sizes.s10),
      LinearPercentIndicator(
          width: Sizes.s120,
          lineHeight: Sizes.s4,
          percent: pc / 100,
          barRadius: const Radius.circular(16),
          progressColor: appColor(context).appTheme.primaryColor),
      SizedBox(
          width: Sizes.s35,
          child: Text(pct,
              textAlign: TextAlign.start,
              style: appCss.dmPoppinsRegular11
                  .textColor(appColor(context).appTheme.lightText))),
      isVisible == true ? Text('$pc%') : Container()
    ]).paddingOnly(bottom: Insets.i5);
  }
}
