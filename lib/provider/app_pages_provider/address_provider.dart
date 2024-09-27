import 'package:fuzzy/config.dart';

class AddressProvider with ChangeNotifier{
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController landMarkController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  GlobalKey<FormState> addressKey = GlobalKey<FormState>();
  final FocusNode nameFocus = FocusNode();
  final FocusNode phoneNumberFocus = FocusNode();
  final FocusNode streetFocus =FocusNode();
  final FocusNode landMarkFocus = FocusNode();
  final FocusNode cityFocus = FocusNode();
  final FocusNode zipCodeFocus = FocusNode();

  String value = "home";
  int selectRadio =0;

  //select address
  selectAddressType(val,index){
    value = val['title']!;
    selectRadio = index;
    notifyListeners();
  }
}