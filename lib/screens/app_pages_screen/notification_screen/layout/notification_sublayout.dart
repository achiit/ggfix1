import '../../../../config.dart';

class NotificationSubLayout extends StatelessWidget {
  final dynamic data;
  final int index;

  const NotificationSubLayout({super.key, this.data, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Sizes.s65,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(bottom: Insets.i10),
        //decoration
        decoration: CommonWidget().decor(context),
        child: Row(children: [
          Container(
              height: Sizes.s48,
              width: Sizes.s48,
              margin: const EdgeInsets.symmetric(horizontal: Insets.i8),
              decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.all(Radius.circular(AppRadius.r12)),
                  color: appColor(context).appTheme.colorContainer),
              //svg image
              child: CommonWidget().svgAssets(context, data['icon'])),
          Expanded(
              flex: 3,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(language(context, data['title']),
                        overflow: TextOverflow.ellipsis,
                        style: appCss.dmPoppinsMedium15
                            .textColor(isThemeColorReturn(context))),
                    Text(language(context, data['subtitle']),
                        overflow: TextOverflow.ellipsis,
                        style: appCss.dmPoppinsRegular12
                            .textColor(appColor(context).appTheme.lightText))
                  ]).paddingOnly(
                  top: Insets.i12, left: Insets.i10, right: Insets.i10))
        ]));
  }
}
