import '../../../../config.dart';
import 'package:fuzzy/plugin_list.dart';

class OnBoardingButtonScreen extends StatelessWidget {
  final int index;
  const OnBoardingButtonScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<OnBoardingProvider>(builder: (context1, onboarding, child) {
      return Stack(children: [
        //on bottom tap
        Container(
            height: Sizes.s59,
            width: Sizes.s59,
            decoration: OnBoardingWidget().decorButton(context),
            padding: const EdgeInsets.all(Sizes.s1),
            child: Container(
              height: Sizes.s57,
              width: Sizes.s57,
              decoration: OnBoardingWidget()
                  .decorColor(appColor(context).appTheme.primaryColor),
              child: Center(
                  child: Container(
                      height: Sizes.s47,
                      width: Sizes.s47,
                      decoration: OnBoardingWidget()
                          .decorColor(appColor(context).appTheme.whiteColor),
                      child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: SvgPicture.asset(svgAssets.arrowNew,
                              fit: BoxFit.scaleDown)))),
            )).inkWell(onTap: () => onboarding.bottomTapped(index, context)),
        const VSpace(Sizes.s40)
      ]);
    });
  }
}
