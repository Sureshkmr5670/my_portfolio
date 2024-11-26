// lib/utils/custom_text_theme.dart
import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/theme/custom_styles/sizes.dart';

class CustomTextTheme {
  CustomTextTheme._();

  // Light Theme
  static TextTheme get lightTextTheme => TextTheme(
        // Titles
        titleLarge: TextStyle(
          fontSize: CustomSizes.titleLarge,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          letterSpacing: 1.2,
          wordSpacing: 2.0,
          overflow: TextOverflow.ellipsis,
        ),
        titleMedium: TextStyle(
          fontSize: CustomSizes.titleMedium,
          fontWeight: FontWeight.w600,
          color: Colors.black,
          letterSpacing: 1.1,
          wordSpacing: 2.0,
          overflow: TextOverflow.ellipsis,
        ),
        titleSmall: TextStyle(
          fontSize: CustomSizes.titleSmall,
          fontWeight: FontWeight.w500,
          color: Colors.black,
          letterSpacing: 1.0,
          wordSpacing: 1.5,
          overflow: TextOverflow.ellipsis,
        ),

        // Headlines
        headlineLarge: TextStyle(
          fontSize: CustomSizes.headlineLarge,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          letterSpacing: 1.2,
          wordSpacing: 2.0,
          overflow: TextOverflow.ellipsis,
        ),
        headlineMedium: TextStyle(
          fontSize: CustomSizes.headlineMedium,
          fontWeight: FontWeight.w600,
          color: Colors.black,
          letterSpacing: 1.1,
          wordSpacing: 2.0,
          overflow: TextOverflow.ellipsis,
        ),
        headlineSmall: TextStyle(
          fontSize: CustomSizes.headlineSmall,
          fontWeight: FontWeight.w500,
          color: Colors.black,
          letterSpacing: 1.0,
          wordSpacing: 1.5,
          overflow: TextOverflow.ellipsis,
        ),

        // Body Texts
        bodyLarge: TextStyle(
          fontSize: CustomSizes.bodyLarge,
          fontWeight: FontWeight.normal,
          color: Colors.black,
          letterSpacing: 0.5,
          wordSpacing: 1.0,
          overflow: TextOverflow.ellipsis,
        ),

        bodyMedium: TextStyle(
          fontSize: CustomSizes.bodyMedium,
          fontWeight: FontWeight.normal,
          color: Colors.black,
          letterSpacing: 0.5,
          wordSpacing: 1.0,
          overflow: TextOverflow.ellipsis,
        ),
        bodySmall: TextStyle(
          fontSize: CustomSizes.bodySmall,
          fontWeight: FontWeight.normal,
          color: Colors.black,
          letterSpacing: 0.5,
          wordSpacing: 1.0,
          overflow: TextOverflow.ellipsis,
        ),

        // Labels
        labelLarge: TextStyle(
          fontSize: CustomSizes.labelLarge,
          fontWeight: FontWeight.w600,
          color: Colors.black,
          letterSpacing: 0.8,
          wordSpacing: 1.5,
          overflow: TextOverflow.ellipsis,
        ),
        labelMedium: TextStyle(
          fontSize: CustomSizes.labelMedium,
          fontWeight: FontWeight.w500,
          color: Colors.black,
          letterSpacing: 0.8,
          wordSpacing: 1.5,
          overflow: TextOverflow.ellipsis,
        ),
        labelSmall: TextStyle(
          fontSize: CustomSizes.labelSmall,
          fontWeight: FontWeight.w400,
          color: Colors.black,
          letterSpacing: 0.8,
          wordSpacing: 1.0,
          overflow: TextOverflow.ellipsis,
        ),

        // Display Texts
        displayLarge: TextStyle(
          fontSize: CustomSizes.displayLarge,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          letterSpacing: 1.5,
          wordSpacing: 2.5,
          overflow: TextOverflow.ellipsis,
        ),
        displayMedium: TextStyle(
          fontSize: CustomSizes.displayMedium,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          letterSpacing: 1.5,
          wordSpacing: 2.5,
          overflow: TextOverflow.ellipsis,
        ),
        displaySmall: TextStyle(
          fontSize: CustomSizes.displaySmall,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          letterSpacing: 1.5,
          wordSpacing: 2.0,
          overflow: TextOverflow.ellipsis,
        ),
      );

  // Dark Theme
  static TextTheme get darkTextTheme => TextTheme(
        // Titles
        titleLarge: TextStyle(
          fontSize: CustomSizes.titleLarge,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: 1.2,
          wordSpacing: 2.0,
          overflow: TextOverflow.ellipsis,
        ),
        titleMedium: TextStyle(
          fontSize: CustomSizes.titleMedium,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          letterSpacing: 1.1,
          wordSpacing: 2.0,
          overflow: TextOverflow.ellipsis,
        ),
        titleSmall: TextStyle(
          fontSize: CustomSizes.titleSmall,
          fontWeight: FontWeight.w500,
          color: Colors.white,
          letterSpacing: 1.0,
          wordSpacing: 1.5,
          overflow: TextOverflow.ellipsis,
        ),

        // Headlines
        headlineLarge: TextStyle(
          fontSize: CustomSizes.headlineLarge,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: 1.2,
          wordSpacing: 2.0,
          overflow: TextOverflow.ellipsis,
        ),
        headlineMedium: TextStyle(
          fontSize: CustomSizes.headlineMedium,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          letterSpacing: 1.1,
          wordSpacing: 2.0,
          overflow: TextOverflow.ellipsis,
        ),
        headlineSmall: TextStyle(
          fontSize: CustomSizes.headlineSmall,
          fontWeight: FontWeight.w500,
          color: Colors.white,
          letterSpacing: 1.0,
          wordSpacing: 1.5,
          overflow: TextOverflow.ellipsis,
        ),

        // Body Texts
        bodyLarge: TextStyle(
          fontSize: CustomSizes.bodyLarge,
          fontWeight: FontWeight.normal,
          color: Colors.white,
          letterSpacing: 0.5,
          wordSpacing: 1.0,
          overflow: TextOverflow.ellipsis,
        ),
        bodyMedium: TextStyle(
          fontSize: CustomSizes.bodyMedium,
          fontWeight: FontWeight.normal,
          color: Colors.white,
          letterSpacing: 0.5,
          wordSpacing: 1.0,
          overflow: TextOverflow.ellipsis,
        ),
        bodySmall: TextStyle(
          fontSize: CustomSizes.bodySmall,
          fontWeight: FontWeight.normal,
          color: Colors.white,
          letterSpacing: 0.5,
          wordSpacing: 1.0,
          overflow: TextOverflow.ellipsis,
        ),

        // Labels
        labelLarge: TextStyle(
          fontSize: CustomSizes.labelLarge,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          letterSpacing: 0.8,
          wordSpacing: 1.5,
          overflow: TextOverflow.ellipsis,
        ),
        labelMedium: TextStyle(
          fontSize: CustomSizes.labelMedium,
          fontWeight: FontWeight.w500,
          color: Colors.white,
          letterSpacing: 0.8,
          wordSpacing: 1.5,
          overflow: TextOverflow.ellipsis,
        ),
        labelSmall: TextStyle(
          fontSize: CustomSizes.labelSmall,
          fontWeight: FontWeight.w400,
          color: Colors.white,
          letterSpacing: 0.8,
          wordSpacing: 1.0,
          overflow: TextOverflow.ellipsis,
        ),

        // Display Texts
        displayLarge: TextStyle(
          fontSize: CustomSizes.displayLarge,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: 1.5,
          wordSpacing: 2.5,
          overflow: TextOverflow.ellipsis,
        ),
        displayMedium: TextStyle(
          fontSize: CustomSizes.displayMedium,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: 1.5,
          wordSpacing: 2.5,
          overflow: TextOverflow.ellipsis,
        ),
        displaySmall: TextStyle(
          fontSize: CustomSizes.displaySmall,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: 1.5,
          wordSpacing: 2.0,
          overflow: TextOverflow.ellipsis,
        ),
      );
}
