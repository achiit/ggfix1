import 'package:fuzzy/plugin_list.dart';
import '../../../config.dart';

class CurrencyScreen extends StatelessWidget {
  const CurrencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrencyProvider>(builder: (context, currency, child) {
      return StatefulWrapper(
          //load event
          onInit: () => Future.delayed(const Duration(milliseconds: 50))
              .then((_) => currency.onReady()),
          //direction
          child: DirectionLayout(
              dChild: Scaffold(
                  backgroundColor:
                      appColor(context).appTheme.backGroundColorMain,
                  body: SafeArea(
                      child: SingleChildScrollView(
                          child: Column(children: [
                    Column(children: [
                      //appbar on currency page
                      CommonAppBar(
                              appName: language(context, appFonts.currency),
                              isIcon: true,
                              onPressed: () => route.pop(context))
                          .paddingSymmetric(
                              vertical: Insets.i10, horizontal: Insets.i20),
                      //currency list layout and list click event
                      Column(
                              children: currency.currencyListData
                                  .asMap()
                                  .entries
                                  .map((e) {
                        return CurrencySubLayout(index: e.key, data: e.value)
                            .inkWell(
                          onTap: () => currency.onSelectCurrencyMethod(
                              e.key, context, e.value),
                        );
                      }).toList())
                          .paddingSymmetric(horizontal: Insets.i20)
                    ])
                  ]))))));
    });
  }
}
