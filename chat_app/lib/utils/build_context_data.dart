import 'package:flutter/material.dart';

class BuildContextData {
  BuildContextData(this.context);
  final BuildContext context;

  MediaQueryData get mediaQueryData => MediaQuery.of(context);
  ThemeData get themeData => Theme.of(context);
  ColorScheme get themeColors => themeData.colorScheme;
  TextTheme get textTheme => themeData.textTheme;
  Color get backgroundColor => themeData.colorScheme.background;
  Color get surfaceColor => themeData.colorScheme.surface;
  Color get onSurfaceColor => themeData.colorScheme.onSurface;
  Color get outline => themeData.colorScheme.outline;

  double get paddingTop => mediaQueryData.padding.top;
  double get paddingBottom => mediaQueryData.padding.bottom;
  double get screenWidth => mediaQueryData.size.width;
  double get screenHeight => mediaQueryData.size.height;

  double get defaultSidePadding => screenWidth * 0.02;

  Widget get vSpaceLarge => SizedBox(height: screenHeight * 0.03);
  Widget get vSpaceMedium => SizedBox(height: screenHeight * 0.02);
  Widget get vSpaceSmall => SizedBox(height: screenHeight * 0.01);
}
