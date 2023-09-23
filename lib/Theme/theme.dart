import 'package:flutter/material.dart';

class AppTheme {
  static const String _poppins = 'Poppins';

  final ThemeData light = ThemeData(
    primarySwatch: Colors.blue,
    appBarTheme: const AppBarTheme(
      color: Color.fromARGB(255, 83, 127, 231),
     
    ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 192, 238, 242),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 83, 127, 231),
        textStyle: const TextStyle(
          fontFamily: _poppins,
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontFamily: _poppins,
        fontWeight: FontWeight.w400,
        fontSize: 14.0,
      ),
    ),
  );

  final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    appBarTheme: AppBarTheme(
      color: const Color.fromARGB(255, 83, 127, 231), toolbarTextStyle: const TextTheme(
        titleLarge: TextStyle(
          fontFamily: _poppins,
          fontWeight: FontWeight.w600,
          fontSize: 18.0,
        ),
      ).bodyMedium, titleTextStyle: const TextTheme(
        titleLarge: TextStyle(
          fontFamily: _poppins,
          fontWeight: FontWeight.w600,
          fontSize: 18.0,
        ),
      ).titleLarge,
    ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 28, 28, 28),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 83, 127, 231),
        textStyle: const TextStyle(
          fontFamily: _poppins,
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontFamily: _poppins,
        fontWeight: FontWeight.w400,
        fontSize: 14.0,
      ),
    ),
  );
}
