 import '../../../../config.dart';
import '../../../../plugin_list.dart';

class RatingSlider extends StatelessWidget {
  const RatingSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<DetailsProvider, ThemeService>(
        builder: (context1, details, theme, child) {
      double clampedValue = details.currentValue.clamp(25.0, 100.0);
      //slider image in bottom layout progress indicator
      return SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.006,
          child: ClipRRect(
              borderRadius:
                  const BorderRadius.all(Radius.circular(AppRadius.r10)),
              child: LinearProgressIndicator(
                  value: clampedValue / 100, // Adjusted the value here
                  valueColor: AlwaysStoppedAnimation<Color>(
                      appColor(context).appTheme.primaryColor),
                  backgroundColor: appColor(context).appTheme.whiteColor)));
    });
  }
}
