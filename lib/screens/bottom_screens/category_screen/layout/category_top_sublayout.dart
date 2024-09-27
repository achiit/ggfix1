import 'package:fuzzy/plugin_list.dart';
import '../../../../config.dart';

class CategoryTopSubLayout extends StatelessWidget {
  final int? index;
  final dynamic data;

  const CategoryTopSubLayout({super.key, this.index, this.data});

  @override
  Widget build(BuildContext context) {
    return Consumer<DirectionProvider>(builder: (context, direction, child) {
      return GestureDetector(
          //more product page open
          onTap: () => route.push(context, ChairScreen(index: index)),
          child: Container(
                  width: MediaQuery.of(context).size.width * 0.77,
                  decoration: BoxDecoration(
                      borderRadius: direction.isDirection || isAr(context)
                          ? const BorderRadius.only(
                              topRight: Radius.circular(AppRadius.r8),
                              bottomRight: Radius.circular(AppRadius.r8))
                          : const BorderRadius.only(
                              topLeft: Radius.circular(AppRadius.r8),
                              bottomLeft: Radius.circular(AppRadius.r8)),
                      color: appColor(context).appTheme.searchBackground),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //text layout
                              Text(language(context, data['title'].toString()),
                                      style: appCss.dmPoppinsMedium16.textColor(
                                          isThemeColorReturn(context)))
                                  .paddingOnly(top: Insets.i15),
                              const VSpace(Sizes.s4), //text layout
                              //text layout
                              Text(
                                  language(
                                      context, data['subtitle'].toString()),
                                  style: appCss.dmPoppinsRegular14.textColor(
                                      appColor(context).appTheme.lightText))
                            ]),
                        //svg icon
                        CommonWidget()
                            .svgAssets(context, svgAssets.iconNextLongArrow)
                            .paddingOnly(bottom: Insets.i15, top: Insets.i20)
                      ]).paddingSymmetric(horizontal: Insets.i15))
              .paddingSymmetric(horizontal: Insets.i20));
    });
  }
}
