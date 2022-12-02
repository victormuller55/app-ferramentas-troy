import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class AppTheme {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.grey[900],
      colorScheme: const ColorScheme.dark());
  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.grey[100],
      colorScheme: const ColorScheme.light());
}
