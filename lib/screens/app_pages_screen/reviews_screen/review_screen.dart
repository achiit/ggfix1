import 'package:fuzzy/config.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: isTheme(context)
            ? appColor(context).appTheme.backGroundColorMain
            : null,
        body: SafeArea(
            child: SingleChildScrollView(
              //direction layout
                child: DirectionLayout(
                    dChild: Column(children: [
          const VSpace(Sizes.s5),
          //appbar for customer review ui
          CommonAppBar(
            appName: language(context, appFonts.customerReviews),
            isIcon: true,
            onPressed: () => route.pop(context),
          ),
          const VSpace(Sizes.s10),
          //list of customer review
          ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: appArray.reviewCustomerList.length,
              itemBuilder: (BuildContext context, int index) {
                return CommonContainer(
                        widget: DetailsReviewSubLayout(
                            index: index,
                            data: appArray.reviewCustomerList[index]))
                    .paddingOnly(bottom: Insets.i10);
              })
        ]).paddingSymmetric(horizontal: Insets.i20)))));
  }
}
