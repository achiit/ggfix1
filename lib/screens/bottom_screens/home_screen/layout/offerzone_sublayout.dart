import '../../../../config.dart';
import '../../../../plugin_list.dart';

class OfferZoneSubLayout extends StatelessWidget {
  final int? index;
  final dynamic data;

  const OfferZoneSubLayout({super.key, this.index, this.data});

  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeProvider, ThemeService>(
        builder: (context1, home, theme, child) {
      return Stack(children: [
        Container(
            //offer decoration layout
            decoration: HomeWidget().decorOfferZone(context),
            child: Row(children: [
              Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Insets.i18, vertical: Insets.i14),
                      height: Sizes.s88,
                      width: Sizes.s88,
                      //offer decoration layout
                      decoration: HomeWidget().offerZoneDecor(context),
                      child: Image.asset(data['image'].toString(),
                          fit: BoxFit.scaleDown))
                  .paddingAll(Insets.i10),
              //offer text layout
              Expanded(
                child: OfferZoneTextLayout(
                  index: index,
                  data: data,
                ),
              )
            ]))
      ]);
    });
  }
}
