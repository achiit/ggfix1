import '../../../config.dart';
import '../../../plugin_list.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer3<HomeProvider, DetailsProvider, DirectionProvider>(
        builder: (context2, home, details, direction, child) {
      return PopScope(
          canPop: true,
          onPopInvoked: (didPop) => details.detailsPopScope(details),
          //direction layout
          child: DirectionLayout(
              dChild: Scaffold(
                  backgroundColor: isTheme(context)
                      ? appColor(context).appTheme.backGroundColorMain
                      : null,
                  body: const Stack(
                    children: [
                      SingleChildScrollView(
                          child: Column(children: [
                        //details all layout
                        DetailsSubLayout()
                      ])),
                      //bottom button layout
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: DetailsSecondBottomLayout()),
                    ],
                  ))));
    });
  }
}
