import 'package:flutter/material.dart';

class ThemeDataUtilsDark {
  static ThemeData get DarkTheme {
    return ThemeData.dark().copyWith(
        colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Colors.green,
      onPrimary: Colors.white,
      secondary: Colors.green,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      background: Colors.green,
      onBackground: Colors.black,
      surface: Colors.green,
      onSurface: Colors.white,
    ));
  }
}

class ThemeDataUtilsLight {
  static ThemeData get LightTheme {
    return ThemeData.light().copyWith(
        colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Colors.green,
      onPrimary: Colors.white,
      secondary: Colors.green,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      background: Colors.white,
      onBackground: Colors.black,
      surface: Colors.white,
      onSurface: Colors.black,
    ));
  }
}
