import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationService extends ChangeNotifier {
  late Map<String, dynamic> _localizedStrings;
  bool _isLocalizationLoaded = false;
  String _selectedLanguageCode = 'ar'; // Default language code

  LocalizationService() {
    _loadLocalizedStrings();
  }

  Map<String, dynamic> get localizedStrings => _localizedStrings;
  bool get isLocalizationLoaded => _isLocalizationLoaded;
  String get selectedLanguageCode => _selectedLanguageCode;

  set selectedLanguageCode(String languageCode) {
    _selectedLanguageCode = languageCode;
    _loadLocalizedStrings();
    _saveSelectedLanguageToPrefs(languageCode);
  }

  Future<void> initLocalization() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedLanguageCode = prefs.getString('language_code');
    if (savedLanguageCode != null) {
      _selectedLanguageCode = savedLanguageCode;
    }
    _loadLocalizedStrings();
  }

  void _loadLocalizedStrings() async {
    try {
      String jsonString = await rootBundle.loadString('assets/languages/$_selectedLanguageCode.json');
      _localizedStrings = json.decode(jsonString);
      _isLocalizationLoaded = true;
      notifyListeners();
    } catch (e) {
      print("Error loading localized strings: $e");
    }
  }

  void _saveSelectedLanguageToPrefs(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', languageCode);
  }

  String getLocalizedString(String key) {
    return _localizedStrings[key] ?? '** $key not found';
  }
}
