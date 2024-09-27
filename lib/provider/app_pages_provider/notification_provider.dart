import '../../config.dart';
import '../../plugin_list.dart';

class NotificationProvider with ChangeNotifier {
  final SharedPreferences sharedPreferences;
  bool isNotification = false;
  bool isBack = false;

  NotificationProvider(this.sharedPreferences);

  //notification toggle button
  btnNotification() {
    isNotification = !isNotification;
    sharedPreferences.setBool(session.isNotification, isNotification);
    notifyListeners();
  }

  //load page
  onReady(context){
    dynamic data= ModalRoute.of(context)!.settings.arguments ;
    isBack = data ??false;
  }
//on back arrow click event
  onBackArrow(context,isBack){
    if (isBack) {
      route.pop(context);
    } else {
      isDashboard(context);
    }
  }

  bool get getNotification =>
      sharedPreferences.getBool(session.isNotification) ?? false;
}
