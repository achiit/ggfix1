import 'package:fuzzy/routes/route_method.dart';
import 'package:fuzzy/routes/route_name.dart';
import 'package:fuzzy/plugin_list.dart';
import '../../config.dart';
import '../common/session.dart';

RouteName routeName = RouteName();
AppRoute appRoute = AppRoute();
Session session = Session();

ThemeService appColor(context) {
  final themeServices = Provider.of<ThemeService>(context, listen: false);
  return themeServices;
}
