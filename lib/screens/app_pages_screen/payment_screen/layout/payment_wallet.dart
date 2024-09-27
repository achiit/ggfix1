import '../../../../config.dart';
import '../../../../plugin_list.dart';

class PaymentWallet extends StatelessWidget {
  const PaymentWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<PaymentProvider, ThemeService>(
        builder: (context1, payment, theme, child) {
      return Container(
        width: MediaQuery.of(context).size.width,
        decoration: PaymentWidget().decoPayment(context),
        //payment wallet sub text layout
        child: Column(
            children:
                appArray.paymentMethod.sublist(2, 6).asMap().entries.map((e) {
          return PaymentSubLayout(index: e.key, data: e.value).inkWell(
            onTap: () => payment.onSelectPaymentMethod(e.value['id']),
          );
        }).toList()),
      );
    });
  }
}
