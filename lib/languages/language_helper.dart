import 'package:flutter/material.dart';

class LanguageHelper {
  convertLangNameToLocale(String langNameToConvert) {
    Locale convertedLocale;

    switch (langNameToConvert) {
      case "english":
        convertedLocale = const Locale('en', 'EN');
        break;
      case 'arabic':
        convertedLocale = const Locale('ar', 'AE');
        break;
      case "france":
        convertedLocale = const Locale('fr', 'FR');
        break;
      case 'hindi':
        convertedLocale = const Locale('hi', 'HI');
        break;
      default:
        convertedLocale = const Locale('en', 'EN');
    }

    return convertedLocale;
  }

  convertLocaleToLangName(String localeToConvert) {
    String langName;

    switch (localeToConvert) {
      case 'en':
        langName = "English";
        break;
      case 'ar':
        langName = "عربي";
        break;
      case 'fr':
        langName = "Français";
        break;
      case 'hi':
        langName = "हिंदी";
        break;
      default:
        langName = "English";
    }

    return langName;
  }
}