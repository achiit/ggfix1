import '../../../../config.dart';
import 'package:fuzzy/plugin_list.dart';

class OnBoardingSubData extends StatelessWidget {
  final int? index;
  final dynamic data;

  const OnBoardingSubData({super.key, this.data, this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<OnBoardingProvider>(builder: (context1, rotation, child) {
      return Stack(children: <Widget>[
        Column(children: [
          const VSpace(Sizes.s20),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: appArray.onBoardingList.asMap().entries.map((e) {
                //indication
                return AnimatedContainer(
                  margin: const EdgeInsets.only(right: Insets.i5),
                  height: Sizes.s5,
                  width: e.key == rotation.currentPage ? Sizes.s18 : Sizes.s5,
                  duration: const Duration(milliseconds: 50),
                  decoration: OnBoardingWidget()
                      .decor(context, rotation.currentPage, e.key),
                );
              }).toList()),
          const VSpace(Sizes.s20),
          Stack(alignment: Alignment.bottomCenter, children: [
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.285,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          height: MediaQuery.of(context).size.height * 0.235,
                          //decoration
                          decoration: OnBoardingWidget().shapeDecor(context),
                          child: Column(children: [
                            const VSpace(Sizes.s25),
                            //text layout
                            OnBoardingWidget().commonText(
                                language(context, data['title']),
                                true,
                                context),
                            const VSpace(Sizes.s6),
                            SizedBox(
                                width: Sizes.s62,
                                child: OnBoardingWidget()
                                    .image(imageAssets.onBoardingLine)),
                            const VSpace(Sizes.s15),
                            //text layout
                            OnBoardingWidget()
                                .commonText(language(context, data['subtext']),
                                    false, context)
                                .paddingSymmetric(horizontal: Insets.i20)
                          ]))
                    ])),
            //Bottom button Layout
            Positioned(
                bottom: MediaQuery.of(context).size.height * 0.008,
                child: OnBoardingButtonScreen(index: index!))
          ])
        ])
      ]);
    });
  }
}
