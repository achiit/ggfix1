import '../../../../config.dart';

class DetailsColorSubLayout extends StatelessWidget {
  final dynamic data;
  const DetailsColorSubLayout({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    //color layout
    return Container(
      alignment: Alignment.center,
      width: Sizes.s20,
      height: Sizes.s20,
      margin: const EdgeInsets.only(right: Insets.i5),
      padding: const EdgeInsets.all(Insets.i4),
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: appColor(context).appTheme.whiteColor),
      child: Container(
              alignment: Alignment.center,
              width: Sizes.s15,
              height: Sizes.s15,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: data['colorCode']))
    );
  }
}
