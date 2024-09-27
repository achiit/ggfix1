import 'package:fuzzy/plugin_list.dart';
import '../../../../config.dart';

class DetailsCheckDeliveryLayout extends StatelessWidget {
  const DetailsCheckDeliveryLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer3<DetailsProvider, ThemeService, DirectionProvider>(
        builder: (context1, details, theme, direction, child) {
      return Column(children: [
        //check delivery text layout and click event
        CommonListHeader(
            text: language(context, appFonts.checkDelivery),
            isClick: details.isCheckDelivery,
            onTap: () => details.isClickDown(appFonts.checkDelivery)),
        details.isCheckDelivery == true
            ? Column(children: [
                //check delivery textfield
                DetailsWidget().checkDeliveryTextField(context),
                const VSpace(Sizes.s15),
                Stack(children: [
                  //check delivery list layout
                  CommonContainer(
                      height: Sizes.s56,
                      widget: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: appArray.checkDeliveryList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return DetailsCheckDeliverySubLayout(
                                index: index,
                                data: appArray.checkDeliveryList[index]);
                          }).paddingAll(Insets.i12))
                ])
              ])
            : Container()
      ]);
    });
  }
}
