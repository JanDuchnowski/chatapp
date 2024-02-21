import 'package:flutter/material.dart';

class AppTheme {
  static final darkTheme = ThemeData(
    primaryColor: const Color.fromRGBO(255, 255, 255, 0.05),
    // high
    scaffoldBackgroundColor: Colors.black,
    // bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: Color.fromRGBO(17, 17, 21, 1)),
    fontFamily: 'Inter',
    colorScheme: const ColorScheme(
      primary: Color(0xFF97E14A),
      primaryContainer: Color.fromRGBO(17, 17, 21, 1),
      secondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFFE0E0E0),
      background: Color.fromARGB(25, 25, 30, 1),
      surface: Color(0xFF111115),
      error: Color(0xFFEF5564),
      onPrimary: Colors.white,
      onSecondary: Colors.black, // borders
      onSurface: Colors.white, // text, icons
      onSurfaceVariant: Color(0xFF9E9E9E),
      onBackground: Colors.black,
      onError: Colors.white,
      brightness: Brightness.light,
      tertiary: Color.fromRGBO(25, 25, 30, 1),
      outline: Color.fromARGB(113, 47, 47, 47), // other border
      outlineVariant: Color.fromRGBO(80, 80, 80, 1),
      surfaceTint: null,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700),
      displayMedium: TextStyle(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
      displaySmall: TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
      headlineLarge: TextStyle(
          color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
      headlineMedium: TextStyle(
          color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
      headlineSmall: TextStyle(
          color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600),
      titleLarge: TextStyle(
          color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
      titleMedium: TextStyle(
          color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
      titleSmall: TextStyle(
          color: Colors.white, fontSize: 10, fontWeight: FontWeight.w400),
      labelLarge: TextStyle(
          color: Colors.white, fontSize: 8, fontWeight: FontWeight.w400),
      labelMedium: TextStyle(
          color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
      labelSmall: TextStyle(
          color: Colors.white, fontSize: 10, fontWeight: FontWeight.w400),
      bodyLarge: TextStyle(
          color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(
          color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
      bodySmall: TextStyle(
          color: Colors.white, fontSize: 10, fontWeight: FontWeight.w400),
    ),
  );
  static final lightTheme = AppTheme.darkTheme.copyWith(
    cardTheme: CardTheme(
      color: const Color.fromRGBO(242, 242, 242, 1),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme(
      primary: const Color(0xFF97E14A),
      primaryContainer:
          const Color.fromARGB(255, 242, 242, 242), // Flipped with secondary
      secondary: const Color(0xFF111115), // Flipped with primaryContainer
      secondaryContainer: const Color.fromARGB(
          255, 254, 254, 254), // Chose a light grey that's visually contrasting
      background: const Color(0xFFFFFFFF), // Flipped with secondaryContainer
      surface: const Color(
          0xFFE0E0E0), // Chose a light grey to contrast with background
      error: const Color(0xFFEF5564),
      onPrimary: Colors.black, // Flipped with onSecondary
      onSecondary: Colors.white, // Flipped with onPrimary
      onSurface: Colors.black, // Flipped with onBackground
      onSurfaceVariant: const Color.fromARGB(
          255, 119, 119, 119), // Darker color for text/icons
      onBackground: Colors.black, // Same as onSurface for clarity
      onError: Colors.black, // Changed for legibility on light error color
      brightness: Brightness.dark, // Indicate that it's a dark theme now
      tertiary: const Color(0xFFE0E0E0),
      onTertiary:
          const Color.fromRGBO(255, 255, 255, 0.5), // Flipped with background
      outline: const Color.fromARGB(
          255, 210, 210, 210), // Flipped to a darker border
      outlineVariant: const Color.fromRGBO(
          220, 220, 220, 1), // Lighter color for better visibility
      surfaceTint: const Color.fromRGBO(126, 203, 47, 1).withOpacity(0.2),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700),
      displayMedium: TextStyle(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
      displaySmall: TextStyle(
          color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
      headlineLarge: TextStyle(
          color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),
      headlineMedium: TextStyle(
          color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500),
      headlineSmall: TextStyle(
          color: Colors.black, fontSize: 10, fontWeight: FontWeight.w600),
      titleLarge: TextStyle(
          color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
      titleMedium: TextStyle(
          color: Colors.black, fontSize: 12, fontWeight: FontWeight.w600),
      titleSmall: TextStyle(
          color: Colors.black, fontSize: 10, fontWeight: FontWeight.w400),
      labelLarge: TextStyle(
          color: Colors.black, fontSize: 8, fontWeight: FontWeight.w400),
      labelMedium: TextStyle(
          color: Colors.black, fontSize: 12, fontWeight: FontWeight.w600),
      labelSmall: TextStyle(
          color: Colors.black, fontSize: 10, fontWeight: FontWeight.w400),
      bodyLarge: TextStyle(
          color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(
          color: Colors.black, fontSize: 12, fontWeight: FontWeight.w400),
      bodySmall: TextStyle(
          color: Colors.black, fontSize: 10, fontWeight: FontWeight.w400),
    ),
  );
}
