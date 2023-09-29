import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const String language_code_ = 'languageCode';

//languages code
const String english = 'en';
const String ukranian = 'uk';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(language_code_, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences prefs_ = await SharedPreferences.getInstance();
  String languageCode = prefs_.getString(language_code_) ?? english;
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case english:
      return const Locale(english, '');
    case ukranian:
      return const Locale(ukranian, "");
    default:
      return const Locale(english, '');
  }
}

//allows us to use translations in app like:
// text: AppLocalizations.of(context)!.shop_drawer,
AppLocalizations translation(BuildContext context) {
  return AppLocalizations.of(
      context)!; // creating AppLocalization method for app
}
//allows us to use translations in app like:
//text: translation(context).shop_drawer,