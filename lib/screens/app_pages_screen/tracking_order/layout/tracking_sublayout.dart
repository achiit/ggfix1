import '../../../../config.dart';
import '../../../../plugin_list.dart';

class TrackingSubLayout extends StatelessWidget {
  final int index;
  final dynamic data;
  const TrackingSubLayout({super.key, required this.index, this.data});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      //tracking list sub layout
      Row(children: [
        //tracking sub layout
        index >= 2
            ? Container(
                height: Sizes.s46,
                width: Sizes.s46,
                padding: const EdgeInsets.all(Insets.i5),
                //decoration
                decoration: TrackingWidget().decorTracking(context, data),
                child: Container(
                    height: Sizes.s36,
                    width: Sizes.s36,
                    padding: const EdgeInsets.all(Insets.i9),
                    //active decoration
                    decoration:
                        TrackingWidget().decorTrackingActive(context, data),
                    child: TrackingWidget().svgPicture(context, data)))
            : SvgPicture.asset(data['icon']),
        Expanded(
            flex: 3,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              //title
              Text(language(context, data['title']),
                  overflow: TextOverflow.ellipsis,
                  style: appCss.dmPoppinsRegular12
                      .textColor(isThemeColorReturn(context))),
              //date
              Text(language(context, data['date']),
                  style: appCss.dmPoppinsRegular10
                      .textColor(appColor(context).appTheme.lightText))
            ]).paddingSymmetric(horizontal: Insets.i15))
      ]).paddingSymmetric(horizontal: Insets.i20),
      //active dash line
      if (index != appArray.orderTrackingList.length - 1)
        Dash(
                direction: Axis.vertical,
                length: Sizes.s30,
                dashLength: Sizes.s5,
                dashThickness: Sizes.s2,
                dashColor: appArray.orderTrackingList[index]['isActive'] == true
                    ? isThemeColorReturn(context)
                    : appColor(context).appTheme.lightText)
            .paddingSymmetric(horizontal: Insets.i42)
    ]);
  }
}
