import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/theme/custom_themes/export.dart';

import '../constants/colors.dart';

// CustomAppTheme.dart
// This file contains the main theme data for the application.
// It defines both light and dark themes with their respective customizations.
// CustomAppTheme class holds the ThemeData for light and dark themes.
class CustomAppTheme {
// Private constructor to prevent instantiation.
  CustomAppTheme._();

  // Light theme configuration.
  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
        brightness: Brightness.light,
        primaryColor: CustomAppColors.light.primaryColor,
        highlightColor: CustomAppColors.light.highlightColor,
        scaffoldBackgroundColor: CustomAppColors.light.scaffoldBackground,
        hoverColor: CustomAppColors.light.hoverPrimary,
        textTheme: CustomTextTheme.lightTextTheme,
        appBarTheme: CustomAppBarTheme.lightAppBarTheme,
        elevatedButtonTheme: CustomElevatedButtonTheme.lightElevatedButtonTheme,
        outlinedButtonTheme: CustomOutlinedButtonTheme.lightOutlinedButtonTheme,
        chipTheme: CustomChipTheme.lightChipTheme,
        checkboxTheme: CustomCheckBoxTheme.lightCheckBoxTheme,
        bottomSheetTheme: CustomBottomSheetTheme.lightBottomSheetTheme,
        inputDecorationTheme: CustomTextFieldTheme.lightInputDecorationTheme,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );

  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
        textTheme: CustomTextTheme.darkTextTheme,
        elevatedButtonTheme: CustomElevatedButtonTheme.darkElevatedButtonTheme,
        chipTheme: CustomChipTheme.darkChipTheme,
        appBarTheme: CustomAppBarTheme.darkAppBarTheme,
        checkboxTheme: CustomCheckBoxTheme.darkCheckBoxTheme,
        bottomSheetTheme: CustomBottomSheetTheme.darkBottomSheetTheme,
        outlinedButtonTheme: CustomOutlinedButtonTheme.darkOutlinedButtonTheme,
        inputDecorationTheme: CustomTextFieldTheme.darkInputDecorationTheme,
      );
}
