import '../../../../config.dart';
import '../../../../plugin_list.dart';

class DetailsReviewSubLayout extends StatelessWidget {
  final int index;
  final dynamic data;

  const DetailsReviewSubLayout({super.key, required this.index, this.data});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(children: [
          //review list image
          Container(
              height: Sizes.s35,
              width: Sizes.s35,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Image.asset(data['image'], fit: BoxFit.scaleDown)),
          const HSpace(Sizes.s10),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //review list name
            Text(language(context, data['name']),
                style: appCss.dmPoppinsRegular14
                    .textColor(isThemeColorReturn(context))),
            //review list time
            Text(language(context, data['time']),
                style: appCss.dmPoppinsRegular12
                    .textColor(appColor(context).appTheme.lightText))
          ])
        ]),
        Row(children: [
          //review list star svg
          SvgPicture.asset(svgAssets.iconStar),
          const HSpace(Sizes.s2),
          //review list rating number
          Text(language(context, data['rating']),
              style: appCss.dmPoppinsRegular12
                  .textColor(isThemeColorReturn(context)))
        ]).paddingOnly(bottom: Insets.i15)
      ]),
      const VSpace(Sizes.s13),
      //review list description
      Text(language(context, data['description']),
          style: appCss.dmPoppinsRegular12
              .textColor(appColor(context).appTheme.lightText))
    ]).paddingAll(Insets.i12);
  }
}
