import '../../../../../config.dart';
import '../../../../../plugin_list.dart';

class DetailsSecondCarouselLayout extends StatelessWidget {
  const DetailsSecondCarouselLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<DetailsProvider, ThemeService>(
        builder: (context1, details, theme, child) {
      return Stack(children: [
        //image details 2 slider
        Image.asset(
            isTheme(context)
                ? imageAssets.imageDetailsCircle
                : imageAssets.imageSliderBackGround,
            fit: BoxFit.scaleDown),
        //carousel slider widget
        CarouselSlider(
            carouselController: details.carouselController,
            items: appArray.imageArraySecond.asMap().entries.map((entry) {
              final imageUrl = entry.value;
              final isEnlarged = details.currentPage;
              return DetailsWidget().alignImage(isEnlarged, imageUrl);
            }).toList(),
            options: CarouselOptions(
                onPageChanged: (index, reason) {
                  details.onChange(index);
                },
                viewportFraction: 0.4,
                enlargeCenterPage: true,
                enlargeFactor: 0.7,
                enlargeStrategy: CenterPageEnlargeStrategy.scale,
                enableInfiniteScroll: true,
                autoPlayCurve: Curves.bounceInOut,
                disableCenter: false,
                initialPage: 1,
                height: Sizes.s300,
                autoPlay: false))
      ]).paddingOnly(left: Insets.i28, right: Insets.i28, top: Insets.i33);
    });
  }
}
