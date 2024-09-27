import '../../../config.dart';

class TermsConditionLayout extends StatelessWidget {
  const TermsConditionLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return DirectionLayout(
        dChild: Scaffold(
            backgroundColor: appColor(context).appTheme.backGroundColorMain,
            body: SafeArea(
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                  //appbar terms and condition page
                  CommonAppBar(
                      appName: language(context, appFonts.termsAndCondition),
                      isIcon: true,
                      onPressed: () => route.pop(context)),
                  const VSpace(Sizes.s20),
                  Text(language(context, appFonts.termsConditionTitle),
                      style: appCss.dmPoppinsBold16
                          .textColor(isThemeColorReturn(context))),
                  const VSpace(Sizes.s20),
                  //terms condition list layout
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: appArray.termsConditionList.length,
                      itemBuilder: (BuildContext context, int index) {
                       // terms.selectedIndex = index;
                        final currentItem =
                            appArray.termsConditionList[index]
                                ['subText'];
                        return TermsConditionSubLayout(
                            data: appArray.termsConditionList[index],
                            subData: currentItem,index: index,);
                      }),
                ]).paddingOnly(
                        left: Insets.i20,
                        right: Insets.i20,
                        bottom: Insets.i20)))));
  }
}
