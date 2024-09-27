import '../../../../config.dart';
import '../../../../plugin_list.dart';

class TrackingOrderJourneyLayout extends StatelessWidget {
  const TrackingOrderJourneyLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, theme, child) {
      return Stack(children: [
        Container(
            width: MediaQuery.of(context).size.width,
            //decoration
            decoration: TrackingWidget().trackingDecor(context),
            padding: const EdgeInsets.only(bottom: Insets.i20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  //text layout
              Text(language(context, appFonts.orderJourney),
                      style: appCss.dmPoppinsSemiBold16
                          .textColor(isThemeColorReturn(context)))
                  .paddingOnly(
                      top: Insets.i20, left: Insets.i20, right: Insets.i20),
              const VSpace(Sizes.s15),
              //tracking list layout
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: appArray.orderTrackingList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TrackingSubLayout(
                        index: index, data: appArray.orderTrackingList[index]);
                  })
            ]))
      ]);
    });
  }
}
