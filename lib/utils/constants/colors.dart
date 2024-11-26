import 'package:flutter/material.dart';

class CustomAppColors {
  CustomAppColors._();

  // Instances of Light and Dark colors
  static final LightColors light = LightColors();
  static final DarkColors dark = DarkColors();
}

class LightColors {
  // Primary color scheme
  final Color primaryColor =
      const Color(0xFF37474F); // Dark blue-grey, good for app bars and headers
  final Color secondaryColor =
      const Color(0xFFCDDC39); // Lime green, for accents and highlights

  // Text colors
  final Color textPrimary = const Color(
      0xFF212121); // Dark grey, for primary text on light backgrounds
  final Color textSecondary =
      const Color(0xFF757575); // Grey, for secondary text and subtitles

  // Background colors
  final Color background =
      const Color(0xFFF5F5F5); // Light grey, for light themes
  final Color scaffoldBackground =
      const Color(0xFFFFFFFF); // White, default background for content areas

  // App bar color for light theme
  final Color appBarColor =
      const Color(0xFF37474F); // Dark blue-grey, for app bars
  final Color surfaceTintColor =
      const Color(0xFF37474F); // Dark blue-grey, for app bars
  // Icon theme color for light theme
  final Color iconThemeColor = Colors.black;

  // Actions icon theme color for light theme
  final Color actionsIconTheme = Colors.black;

  // Title text style color for light theme
  final Color titleTextStyle = Colors.black;

  // Container colors
  final Color container =
      const Color(0xFFFFFFFF); // White, for cards and sheets

  // Button colors
  final Color buttonPrimary =
      const Color(0xFFC62828); // Red, for primary buttons
  final Color buttonSecondary =
      const Color(0xFFCDDC39); // Lime green, for secondary buttons
  final Color buttonDisabled =
      const Color(0xFFBDBDBD); // Grey, for disabled buttons

//Hover colors
  final Color hoverPrimary =
      const Color(0xFF102027); // Darker shade of primary color for hover effect
  final Color hoverSecondary = const Color(
      0xFFAFB42B); // Lighter shade of secondary color for hover effect

  // Border colors
  final Color border =
      const Color(0xFFBDBDBD); // Grey, for borders in light theme

  // Error and Validation colors
  final Color error =
      const Color(0xFFD32F2F); // Dark red, for error messages and icons
  final Color success =
      const Color(0xFF4CAF50); // Green, for success messages and icons
  final Color warning =
      const Color(0xFFFFC107); // Amber, for warning messages and icons
  final Color info =
      const Color(0xFF2196F3); // Blue, for informational messages and icons

  // Neutral shades
  final Color black = const Color(0xFF000000); // Black, for text and icons
  final Color white =
      const Color(0xFFFFFFFF); // White, for text and icons on dark backgrounds
  final Color gray = const Color(
      0xFF9E9E9E); // Medium grey, for placeholder text and unselected icons
  final Color grayLight = const Color(
      0xFFE0E0E0); // Light grey, for backgrounds and disabled elements
  final Color grayDark = const Color(
      0xFF616161); // Dark grey, for text and icons on light backgrounds

  // Additional colors
  final Color overlay =
      const Color(0x66FFFFFF); // Translucent white, for overlays and backdrops
  final Color highlightColor = const Color(
      0x66CDDC39); // Translucent lime green, for highlighting selected items
}

class DarkColors {
  // Primary color scheme
  final Color primaryColor =
      const Color(0xFF263238); // Dark blue-grey, for dark themes
  final Color secondaryColor =
      const Color(0xFFCDDC39); // Lime green, for accents and highlights

  // Text colors
  final Color textPrimary =
      const Color(0xFFFFFFFF); // White, for text on dark backgrounds
  final Color textSecondary =
      const Color(0xFFBDBDBD); // Light grey, for secondary text and subtitles

  // Background colors
  final Color background =
      const Color(0xFF263238); // Dark blue-grey, for dark themes
  final Color scaffoldBackground =
      const Color(0xFF121212); // Darker shade for scaffold background

  // App bar color for dark theme
  final Color appBarColor =
      const Color(0xFF263238); // Dark blue-grey, for app bars
  final Color surfaceTintColor =
      const Color(0xFF37474F); // Dark blue-grey, for app bars
  // Icon theme color for dark theme
  final Color iconThemeColor = Colors.white;

  // Actions icon theme color for dark theme
  final Color actionsIconTheme = Colors.white;

  // Title text style color for dark theme
  final Color titleTextStyle = Colors.white;

  // Container colors
  final Color container = const Color(
      0xFF37474F); // Dark blue-grey, for cards and sheets in dark theme

//Hover colors
  final Color hoverPrimary =
      const Color(0xFF102027); // Darker shade of primary color for hover effect
  final Color hoverSecondary = const Color(
      0xFFAFB42B); // Lighter shade of secondary color for hover effect

  // Button colors
  final Color buttonPrimary =
      const Color(0xFFC62828); // Red, for primary buttons
  final Color buttonSecondary =
      const Color(0xFFCDDC39); // Lime green, for secondary buttons
  final Color buttonDisabled =
      const Color(0xFF616161); // Dark grey, for disabled buttons

  // Border colors
  final Color border =
      const Color(0xFF37474F); // Dark blue-grey, for borders in dark theme

  // Error and Validation colors
  final Color error =
      const Color(0xFFD32F2F); // Dark red, for error messages and icons
  final Color success =
      const Color(0xFF4CAF50); // Green, for success messages and icons
  final Color warning =
      const Color(0xFFFFC107); // Amber, for warning messages and icons
  final Color info =
      const Color(0xFF2196F3); // Blue, for informational messages and icons

  // Neutral shades
  final Color black = const Color(0xFF000000); // Black, for text and icons
  final Color white =
      const Color(0xFFFFFFFF); // White, for text and icons on dark backgrounds
  final Color gray = const Color(
      0xFF9E9E9E); // Medium grey, for placeholder text and unselected icons
  final Color grayLight = const Color(
      0xFFE0E0E0); // Light grey, for backgrounds and disabled elements
  final Color grayDark = const Color(
      0xFF616161); // Dark grey, for text and icons on light backgrounds

  // Additional colors
  final Color overlay =
      const Color(0x66000000); // Translucent black, for overlays and backdrops
  final Color highlightColor = const Color(
      0x66CDDC39); // Translucent lime green, for highlighting selected items
}
