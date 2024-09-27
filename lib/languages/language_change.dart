import 'package:fuzzy/languages/language_helper.dart';
import '../config.dart';
import '../plugin_list.dart';

class LanguageProvider with ChangeNotifier {
  String currentLanguage = appFonts.english;
  Locale? locale;
  int selectedIndex = 0;
  final SharedPreferences sharedPreferences;

  LanguageProvider(this.sharedPreferences) {
    var selectedLocale = sharedPreferences.getString("selectedLocale");
    if (selectedLocale != null) {
      locale = Locale(selectedLocale);
    } else {
      selectedLocale = "english";
      locale = const Locale("en");
    }
    setVal(selectedLocale);
  }

  LanguageHelper languageHelper = LanguageHelper();

  void changeLocale(String newLocale) {
    Locale convertedLocale;
    currentLanguage = newLocale;
    convertedLocale = languageHelper.convertLangNameToLocale(newLocale);
    locale = convertedLocale;
    sharedPreferences.setString(
        'selectedLocale', locale!.languageCode.toString());
    notifyListeners();
  }

  setVal(value) {
    if (value == "en") {
      currentLanguage = "english";
    } else if (value == "ar") {
      currentLanguage = "arabic";
    } else if (value == "fr") {
      currentLanguage = "france";
    } else if (value == "hi") {
      currentLanguage = "hindi";
    } else {
      currentLanguage = "english";
    }
    notifyListeners();
    changeLocale(currentLanguage);
  }

  getLocal() {
    var selectedLocale = sharedPreferences.getString("selectedLocale");
    return selectedLocale;
  }

  defineCurrentLanguage(context) {
    String? definedCurrentLanguage;

    if (currentLanguage.isNotEmpty) {
      definedCurrentLanguage = currentLanguage;
    } else {
      definedCurrentLanguage = languageHelper
          .convertLocaleToLangName(Localizations.localeOf(context).toString());
    }
    return definedCurrentLanguage;
  }
}
