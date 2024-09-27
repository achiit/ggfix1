import 'package:fuzzy/plugin_list.dart';
import '../../../../config.dart';

class OfferZoneGridLayout extends StatelessWidget {
  final int? index;
  final dynamic data;

  const OfferZoneGridLayout({super.key, this.index, this.data});

  @override
  Widget build(BuildContext context) {
    return Consumer<DirectionProvider>(builder: (context1, direction, child) {
      return Stack(children: [
        //offerzone sub text layout
        OfferZoneSubLayout(
          index: index,
          data: data,
        ),
        //offer design layout
        HomeWidget()
            .align(
                context,
                CustomPaint(
                    painter: RPSCustomPainter(),
                    child: Column(children: [
                      Text(language(context, data['offerDiscount'].toString()),
                              style: appCss.dmPoppinsSemiBold9.textColor(
                                  appColor(context).appTheme.whiteColor))
                          .paddingSymmetric(horizontal: Insets.i5),
                      Text(language(context, data['offer'].toString()),
                          style: appCss.dmPoppinsMedium6.textColor(
                              appColor(context).appTheme.whiteColor)),
                    ])))
            .paddingSymmetric(horizontal: Insets.i20)
      ]);
    });
  }
}
