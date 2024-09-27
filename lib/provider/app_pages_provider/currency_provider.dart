import 'package:fuzzy/config.dart';
import '../../plugin_list.dart';

class CurrencyProvider with ChangeNotifier {
  int? value = 0;
  double currencyVal = 1.0;
  String? priceSymbol = "\$";
  int? selectIndex = 0;
  int? index = 0;
  String? symbolData;
  String? symbol;
  Locale? locale;
  bool isInvisible = false;
  final SharedPreferences sharedPreferences;

  List currencyListData = [];
// currency store local storage
  CurrencyProvider(this.sharedPreferences) {
    double? storedCurrencyVal = sharedPreferences.getDouble('currencyData');
    index = sharedPreferences.getInt('selectedIndex');
    symbol = sharedPreferences.getString("symbol");

    if (storedCurrencyVal != null && symbol != null && index != null) {
      currencyVal = storedCurrencyVal;
      priceSymbol = symbol;
      selectIndex = index;
    }
  }

//page load
  void onReady() {
    currencyListData = appArray.currencyList;
    notifyListeners();
  }

//select currency
  onSelectCurrencyMethod(index, context, data) {
    selectIndex = index;
    currency(context).priceSymbol = data['symbol'].toString();
    final currencyData = Provider.of<CurrencyProvider>(context, listen: false);
    currencyData.currencyVal =
        double.parse(data['exchange_rate'].toString()).toDouble();
    symbolData = data['symbol'].toString();
    sharedPreferences.setDouble('currencyData', currencyData.currencyVal);
    sharedPreferences.setInt("selectedIndex", selectIndex!);
    sharedPreferences.setString("symbol", symbolData!);
    currencyData.notifyListeners();
    notifyListeners();
  }

//symbol set
  setVal() {
    priceSymbol = symbolData!;
    notifyListeners();
  }
}
