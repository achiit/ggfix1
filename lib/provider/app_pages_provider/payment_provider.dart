import '../../config.dart';

class PaymentProvider with ChangeNotifier {
  int selectIndex = 1;

  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardHolderNameController = TextEditingController();
  TextEditingController cardCVVController = TextEditingController();
  TextEditingController cardDateController = TextEditingController();
  final FocusNode cardNumberFocus = FocusNode();
  final FocusNode cardHolderNameFocus = FocusNode();
  final FocusNode cardCVVFocus = FocusNode();
  final FocusNode cardDateFocus = FocusNode();

  GlobalKey<FormState> addCardKey = GlobalKey<FormState>();
  bool isBack = false;

  //load page
  onReady(context) {
    dynamic data = ModalRoute.of(context)!.settings.arguments;
    isBack = data ?? false;
  }

//select payment index
  onSelectPaymentMethod(index) {
    selectIndex = index;
    notifyListeners();
  }

//after payment dialog box open
  onContinue(context) {
    showDialog(
      context: context,
      builder: (context1) {
        return const PaymentAlertDialog();
      },
    );
  }

  //button press
 onBtnPayNow(context,payment){
   if (payment.isBack) {
     route.pop(context);
   } else {
     payment.onContinue(context);
   }
 }
}
