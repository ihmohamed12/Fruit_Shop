import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.red,
    primarySwatch: primaryBlack,
    backgroundColor: Colors.black.withOpacity(0.98),
    primaryColorBrightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.grey[850],
    accentColor: Colors.blue[500],
    accentColorBrightness: Brightness.dark,
    iconTheme: IconThemeData(color: Colors.white),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.red,
        selectedIconTheme: IconThemeData(
          color: Colors.red,
        )));

const MaterialColor white = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: const Color(0xFFFFFFFF),
    100: const Color(0xFFFFFFFF),
    200: const Color(0xFFFFFFFF),
    300: const Color(0xFFFFFFFF),
    400: const Color(0xFFFFFFFF),
    500: const Color(0xFFFFFFFF),
    600: const Color(0xFFFFFFFF),
    700: const Color(0xFFFFFFFF),
    800: const Color(0xFFFFFFFF),
    900: const Color(0xFFFFFFFF),
  },
);
const int _blackPrimaryValue = 0xFF000000;

const MaterialColor primaryBlack = MaterialColor(
  _blackPrimaryValue,
  <int, Color>{
    50: Color(0xFF000000),
    100: Color(0xFF000000),
    200: Color(0xFF000000),
    300: Color(0xFF000000),
    400: Color(0xFF000000),
    500: Color(_blackPrimaryValue),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);

final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: white,
    primaryColor: Colors.white.withOpacity(0.98),
    backgroundColor: Colors.white.withOpacity(0.98),
    primaryColorBrightness: Brightness.light,
    scaffoldBackgroundColor: Colors.grey[200],
    accentColor: Colors.purple[500],
    accentColorBrightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey.withOpacity(0.8),
        selectedItemColor: Colors.red,
        selectedIconTheme: const IconThemeData(
          color: Colors.red,
        )));
