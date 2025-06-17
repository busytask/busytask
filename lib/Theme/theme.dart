import 'package:flutter/material.dart';

class ThemeManager with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.dark;

  get themeMode => _themeMode;

  toggleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

const primaryColor = Color(0xff0DA6C2);
const lightTitleColor = Color(0xFF1A1A1A);
// const lightGreyTextColor = Color(0xFF484848);
const lightGreyTextColor = Color(0xFF7F7F7F);
const darkTitleColor = Color(0xFFFFFFFF);
const darkGreyTextColor = Color(0xFFACACAC);
const darkContainer = Color(0xff323241);
const lightContainer = Color(0xFFFFFFFF);
const darkContainerColor = Color(0xFF181824);
const lightContainerColor = Color(0xFFF4F4F4);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: primaryColor,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: primaryColor),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    brightness: Brightness.light,
    primary: const Color(0xff0DA6C2),
    primaryContainer: const Color(0xff262450),
    surface: const Color(0xff19173D),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  switchTheme: SwitchThemeData(
    trackColor: WidgetStateProperty.all<Color>(Colors.grey),
    thumbColor: WidgetStateProperty.all<Color>(Colors.white),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    brightness: Brightness.dark,
    primary: const Color(0xff0DA6C2),
    primaryContainer: const Color(0xff262450),
    surface: const Color(0xff19173D),
  ),
);
