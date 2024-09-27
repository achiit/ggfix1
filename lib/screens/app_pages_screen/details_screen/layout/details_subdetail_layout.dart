import 'package:fuzzy/plugin_list.dart';
import '../../../../config.dart';

class DetailsSubDetailLayout extends StatelessWidget {
  const DetailsSubDetailLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailsProvider>(builder: (context1, details, child) {
      return Column(
        children: [
          //details text layout
          CommonListHeader(
              text: language(context, appFonts.details),
              isClick: details.isDetails,
              onTap: () => details.isClickDown(appFonts.details)),
          //details sub text layout
          details.isDetails == true
              ? CommonContainer(
                  widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //details container description
                      Text(language(context, appFonts.detailDescription),
                          style: appCss.dmPoppinsRegular13
                              .textColor(appColor(context).appTheme.lightText)),
                      //read more text
                      Text(language(context, appFonts.readMore),
                          style: appCss.dmPoppinsBold13
                              .textColor(appColor(context).appTheme.lightText))
                    ]).paddingAll(Insets.i12))
              : Container(),
        ],
      );
    });
  }
}
