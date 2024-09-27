import '../../../../config.dart';
import '../../../../plugin_list.dart';

class DetailsSubLayout extends StatelessWidget {
  const DetailsSubLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailsProvider>(builder: (context1, details, child) {
      return Stack(children: [
        //appbar on details page
        const DetailSubLayoutOne(),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const VSpace(Sizes.s112),
          //carousel layout on details page
          const DetailsSubLayoutCarousel(),
          const VSpace(Sizes.s35),
          //liner fill line layout and color layout
          const DetailsColorLayout(),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //top name and off text layout
            const DetailsSubLayoutName(),
            Column(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //count stepper, dimension layout
                  const DetailsSubLayoutThird(),
                  //check delivery layout
                  const DetailsCheckDeliveryLayout(),
                  //Details layout
                  const DetailsSubDetailLayout(),
                  //review layout
                  const DetailsReviewLayout(),
                  //write review  and similar text layout
                  DetailsWidget().writeReview(context, details),
                ],
              ).paddingOnly(left: Insets.i20, right: Insets.i20),
              VSpace(isTheme(context) ? Sizes.s0 : Sizes.s10),
              Container(
                  color: appColor(context).appTheme.backGroundColorMain,
                  child: Column(
                    children: [
                      const VSpace(Sizes.s10),
                      //similar text layout
                      HomeWidget().listNameCommon(
                          context, language(context, appFonts.similarProduct)),
                      const VSpace(Sizes.s15),
                      //similar product
                      const NewArrivalLayout(),
                    ],
                  ).paddingOnly(
                      left: Insets.i20,
                      right: Insets.i20,
                      bottom: MediaQuery.of(context).size.height * 0.11))
            ])
          ])
        ])
      ]);
    });
  }
}
