import '../../../../../config.dart';
import '../../../../../plugin_list.dart';

class DetailsCheckDeliverySubLayoutOne extends StatelessWidget {
  final dynamic data;
  const DetailsCheckDeliverySubLayoutOne({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context1, theme, child) {
      return Container(
          height: Sizes.s105,
          width: Sizes.s102,
          //details check deliver decoration
          decoration: DetailsWidget().decorDetailsCheckDelivery(context),
          padding: const EdgeInsets.all(Insets.i15),
          child: Column(children: [
            SizedBox(
                width: Sizes.s26,
                height: Sizes.s26,
                //svg image
                child: DetailsWidget().svgImage(context, data)),
            const VSpace(Sizes.s7),
            Expanded(
                flex: 1,
                //title
                child: Text(language(context, data['title']),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: appCss.dmPoppinsRegular12.textColor(isTheme(context)
                        ? appColor(context).appTheme.lightText
                        : appColor(context).appTheme.primaryColor)))
          ]));
    });
  }
}
