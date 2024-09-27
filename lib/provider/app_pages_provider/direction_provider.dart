import '../../config.dart';
import '../../plugin_list.dart';

class DirectionProvider with ChangeNotifier {
  final SharedPreferences sharedPreferences;
  bool isDirection = false;

  DirectionProvider(this.sharedPreferences);

//direction
  btnDirection() {
    isDirection = !isDirection;
    sharedPreferences.setBool(session.isDirection, isDirection);
    notifyListeners();
  }

  bool get getDirection =>
      sharedPreferences.getBool(session.isDirection) ?? false;
}
