import '../../../../config.dart';
import '../../../../plugin_list.dart';

class DetailsSubLayoutCarousel extends StatelessWidget {
  const DetailsSubLayoutCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailsProvider>(builder: (context1, details, child) {
      //carousel slider layout
      return CarouselSlider(
          carouselController: details.carouselController,
          items: appArray.imageArray.asMap().entries.map((entry) {
            final index = entry.key;
            final imageUrl = entry.value;
            final isEnlarged = index == details.currentPage;
            return DetailsCarousel(
              data: imageUrl,
              index: isEnlarged,
            );
          }).toList(),
          options: CarouselOptions(
              onPageChanged: (isEnlarged, reason) {
                details.onChangePage(isEnlarged);
              },
              disableCenter: true,
              padEnds: false,
              enlargeStrategy: CenterPageEnlargeStrategy.values.first,
              height: Sizes.s238,
              animateToClosest: true,
              viewportFraction: 0.6,
              enlargeCenterPage: true,
              enlargeFactor: 0.65,
              enableInfiniteScroll: true,
              initialPage: 0,
              autoPlay: false));
    });
  }
}
