import '../../../../config.dart';
import '../../../../plugin_list.dart';

class WishlistSubLayout extends StatelessWidget {
  final int index;
  final dynamic data;

  const WishlistSubLayout({super.key, required this.index, this.data});

  @override
  Widget build(BuildContext context) {
    return Consumer2<WishlistProvider, ThemeService>(
        builder: (context1, wishlist, theme, child) {
      return Stack(children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.125,
            width: MediaQuery.of(context).size.width,
            decoration: CommonWidget().decor(context)),
        Row(children: [
          Container(
                  height: MediaQuery.of(context).size.height * 0.105,
                  width: MediaQuery.of(context).size.width * 0.22,
                  padding: const EdgeInsets.all(Insets.i8),
                  decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(AppRadius.r8)),
                      color: appColor(context).appTheme.colorContainer),
                  child: Image.asset(data['image'].toString(),
                      fit: BoxFit.scaleDown))
              .paddingSymmetric(horizontal: Insets.i10),
          //wishlist subtext layout
          WishlistTextSubLayout(index: index, data: data)
        ]).paddingOnly(top: Insets.i8),
        Stack(children: [
          //alignment set close button with click event
          CommonWidget().topAlign(
              context,
              IconButton(
                  icon: CommonWidget().svgAssets(context, svgAssets.iconClose),
                  onPressed: () => wishlist.removeProduct(index))),
          //edit button layout with click event and alignment set
          CommonWidget().bottomAlign(
              context,
              Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.075,
                      right: Insets.i10,
                      left: Insets.i10),
                  child: CommonEditButton(
                      imagePath: svgAssets.iconCartFill,
                      onPressed: () => wishlist.moveToCart(index, context))))
        ])
      ]);
    });
  }
}
