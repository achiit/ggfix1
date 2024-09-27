import '../../config.dart';

class HelpProvider with ChangeNotifier {
  int selectedIndex = 0;

//help dropdown selected
  isClickDown(dynamic value, context) {
    if (value['title'] == appFonts.queryOne ||
        value['title'] == appFonts.queryTwo ||
        value['title'] == appFonts.queryThird ||
        value['title'] == appFonts.queryFour ||
        value['title'] == appFonts.queryFive) {
      value['isSublistOpen'] = !value['isSublistOpen'];
    }
    notifyListeners();
  }
}
