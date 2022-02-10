import 'package:flutter/material.dart';
import 'package:shopping_cart/model/dark_theme_preference.dart';
class DarkThemeProvider with ChangeNotifier{
  DarkThemePreferences darkThemePreferences=DarkThemePreferences();
  bool _darkTheme=false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreferences.setDarkTheme(value);
    notifyListeners();
  }
}