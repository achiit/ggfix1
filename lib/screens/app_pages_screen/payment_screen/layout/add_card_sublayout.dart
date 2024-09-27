import 'package:fuzzy/plugin_list.dart';
import '../../../../config.dart';

class AddCardSubLayout extends StatelessWidget {
  const AddCardSubLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentProvider>(builder: (context1, payment, child) {
      return Row(children: [
        Expanded(
            child: Column(children: [
          //common text layout
          ShippingWidget()
              .textCommon(language(context, appFonts.cvv), false, context),
          const VSpace(Sizes.s6),
          CommonTextFieldAddress(
              hintText: language(context, appFonts.hintCvv),
              controller: payment.cardCVVController,
              keyboardType: TextInputType.number,
              focusNode: payment.cardCVVFocus,
             /* validator: (value) => Validation().nameValidation(context, value)*/)
        ])),
        const HSpace(Sizes.s15),
        Expanded(
            child: Column(children: [
          //common text layout
          ShippingWidget().textCommon(
              language(context, appFonts.transData), false, context),
          const VSpace(Sizes.s6),
          CommonTextFieldAddress(
              hintText: language(context, appFonts.hintDate),
              controller: payment.cardDateController,
              keyboardType: TextInputType.datetime,
              focusNode: payment.cardDateFocus,
              /*validator: (value) => Validation().nameValidation(context, value)*/)
        ]))
      ]);
    });
  }
}
