import 'package:flutter/material.dart';

class AppTheme {
  static final darkTheme = ThemeData(
    primaryColor: const Color.fromRGBO(0, 0, 0, 0.05),
    scaffoldBackgroundColor: Colors.black,
    fontFamily: 'Inter',
    colorScheme: const ColorScheme(
      primary: Colors.white,
      primaryContainer: Colors.black,
      secondary: Colors.white,
      secondaryContainer: Colors.white,
      background: Colors.black,
      surface: Colors.black,
      error: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.white,
      onSurfaceVariant: Colors.white,
      onBackground: Colors.white,
      onError: Colors.white,
      brightness: Brightness.light,
      tertiary: Colors.black,
      outline: Colors.black,
      outlineVariant: Colors.black,
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
    sliderTheme: SliderThemeData(
      activeTrackColor: Colors.black.withOpacity(0.5),
      inactiveTrackColor: Colors.white,
      thumbColor: Colors.black,
      overlayColor: const Color(0x2997E14A),
      valueIndicatorColor: Colors.black.withOpacity(0.5),
      showValueIndicator: ShowValueIndicator.always,
      valueIndicatorTextStyle: const TextStyle(
        color: Colors.black,
      ),
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme(
      primary: Colors.white,
      primaryContainer: Colors.white,
      secondary: Colors.black,
      secondaryContainer: Colors.white,
      background: Colors.white,
      surface: Colors.white,
      error: Colors.white,
      onPrimary: Colors.black,
      onSecondary: Colors.white,
      onSurface: Colors.black,
      onSurfaceVariant: Colors.black,
      onBackground: Colors.black,
      onError: Colors.black,
      brightness: Brightness.dark,
      tertiary: Colors.white,
      onTertiary: Colors.white,
      outline: Colors.black,
      outlineVariant: Colors.white,
      surfaceTint: Colors.white.withOpacity(0.2),
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
