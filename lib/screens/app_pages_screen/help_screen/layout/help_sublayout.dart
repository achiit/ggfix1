import 'package:fuzzy/plugin_list.dart';
import '../../../../config.dart';

class HelpSubLayout extends StatelessWidget {
  final dynamic data;
  final dynamic subData;

  const HelpSubLayout({super.key, this.data, this.subData});

  @override
  Widget build(BuildContext context) {
    return Consumer<HelpProvider>(builder: (context1, help, child) {
      return Column(children: [
        //onTap event
        GestureDetector(
            onTap: () => help.isClickDown(data, context),
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.06,
                padding: const EdgeInsets.all(Insets.i8),
                //decoration
                decoration: HelpWidget().decor(context),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 3,
                          child: Text(language(context, data['title']),
                              overflow: TextOverflow.ellipsis,
                              style: appCss.dmPoppinsRegular14
                                  .textColor(isThemeColorReturn(context)))),
                      data['isSublistOpen'] == true
                          ? Container()
                          //svg image
                          : CommonWidget()
                              .svgAssets(context, svgAssets.iconArrowDown),
                    ]))),
        const VSpace(Sizes.s8),
        if (data['isSublistOpen'])
          //sub layout list
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: subData.length,
              itemBuilder: (BuildContext context, int innerIndex) {
                return HelpWidget()
                    .subLayoutList(context, subData[innerIndex]['subtitle']);
              }),
        const VSpace(Sizes.s8)
      ]);
    });
  }
}
