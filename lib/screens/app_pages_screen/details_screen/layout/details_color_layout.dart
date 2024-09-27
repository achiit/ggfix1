import '../../../../config.dart';

class DetailsColorLayout extends StatelessWidget {
  const DetailsColorLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      const SizedBox(
        width: Sizes.s215,
        //fill liner container layout
        child: RatingSlider(),
      ),
      //color layout list
      Row(
          children: appArray.colorList.asMap().entries.map((e) {
        return DetailsColorSubLayout(data: e.value);
      }).toList()),
    ]).paddingSymmetric(horizontal: Insets.i20);
  }
}
