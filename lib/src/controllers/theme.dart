import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme.light().copyWith(
      primary: Color.fromARGB(255, 102, 194, 255),
      onPrimary: Colors.black,
      secondary: Color.fromARGB(255, 111, 0, 255),
      surface: Color.fromRGBO(0, 255, 85, 1),
      background: Colors.white,
      onBackground: Color.fromARGB(255, 15, 50, 120),
      tertiary: Colors.white,
      onTertiary: Color.fromARGB(255, 217, 218, 224)
    ),
    scaffoldBackgroundColor: Colors.transparent,
    iconTheme: const IconThemeData(color: Color.fromARGB(255, 44, 10, 95)),
    bottomSheetTheme: BottomSheetThemeData(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)))),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(
        color: Color.fromRGBO(0, 0, 255, 100),
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: const Color(0xFF172774),
      ),
      titleMedium: TextStyle(
        color: const Color(0xFF172774),
      ),
      titleSmall: TextStyle(
        color: const Color(0xFF172774),
      ),
      bodyLarge: TextStyle(
        color: const Color(0xFF172774),
      ),
      bodyMedium: TextStyle(
        color: const Color(0xFF172774),
      ),
      bodySmall: TextStyle(
        color: const Color(0xFF172774),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            primary: Colors.black,
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(14))))),
  );

ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark().copyWith(
      primary: const Color(0xFF172774),
      onPrimary: Colors.white,
      secondary: Color.fromARGB(255, 141, 1, 66),
      surface: Colors.white,
      background: Color.fromARGB(221, 19, 8, 33),
      onBackground: Colors.white,
      tertiary: Color.fromARGB(255, 24, 25, 41),
      onTertiary: Color.fromARGB(255, 15, 16, 31),
    ),
    scaffoldBackgroundColor: Colors.transparent,
    iconTheme: const IconThemeData(color: Colors.white),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: Colors.white),
      titleMedium: TextStyle(color: Colors.white),
      titleSmall: TextStyle(color: Colors.white),
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      bodySmall: TextStyle(color: Colors.grey),
    ),
  );
