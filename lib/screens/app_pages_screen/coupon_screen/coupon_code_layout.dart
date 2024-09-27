import 'package:fuzzy/plugin_list.dart';
import '../../../config.dart';

class CouponCodeLayout extends StatelessWidget {
  const CouponCodeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, theme, child) {
      return DirectionLayout(
          dChild: Scaffold(
              backgroundColor: appColor(context).appTheme.backGroundColorMain,
              body: SafeArea(
                  child: SingleChildScrollView(
                      child: Column(children: [
                //appbar on coupon code layout
                CommonAppBar(
                  appName: language(context, appFonts.coupon),
                  isIcon: true,
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.25),
                  onPressed: () => route.pop(context),
                ).paddingOnly(bottom: Insets.i10),
                //layout of coupon code list
                ...appArray.couponList
                    .asMap()
                    .entries
                    .map((e) => CouponCodeSubLayoutOne(
                          index: e.key,
                          data: e.value,
                        ))
                    .toList()
              ])
                          .paddingOnly(top: Insets.i10)
                          .paddingSymmetric(horizontal: Insets.i20)))));
    });
  }
}
