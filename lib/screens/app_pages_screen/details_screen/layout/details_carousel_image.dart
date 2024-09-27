import '../../../../config.dart';

class DetailsCarousel extends StatelessWidget {
  final dynamic data;
  final dynamic index;
  const DetailsCarousel({super.key, this.data, required this.index});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      //carousel image
      return Stack(children: [
        Positioned.fill(
            child: Opacity(
                opacity: index ? 1.0 : 0.5,
                child: Image.asset(data, fit: BoxFit.cover)))
      ]);
    });
  }
}
