import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../custom_styles/sizes.dart';

class CustomElevatedButtonTheme {
  CustomElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: CustomAppColors.light.textPrimary,
      backgroundColor: CustomAppColors.light.buttonPrimary,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(CustomSizes.buttonRadius)),
      disabledBackgroundColor: CustomAppColors.light.buttonDisabled,
      disabledForegroundColor: CustomAppColors.light.gray,
      side: BorderSide(color: CustomAppColors.light.primaryColor),
      padding:  EdgeInsets.symmetric(
          vertical: CustomSizes.xl, horizontal: CustomSizes.xl),
      textStyle: TextStyle(
        fontSize: CustomSizes.fontSizeMd,
        color: CustomAppColors.light.textPrimary,
        fontWeight: CustomSizes.fontWeightMedium,
      ),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      
      elevation: 0,
      foregroundColor: CustomAppColors.dark.textPrimary,
      backgroundColor: CustomAppColors.dark.buttonPrimary,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(CustomSizes.buttonRadius)),
      disabledBackgroundColor: CustomAppColors.dark.buttonDisabled,
      disabledForegroundColor: CustomAppColors.dark.gray,
      side: BorderSide(color: CustomAppColors.dark.primaryColor),
      padding:  EdgeInsets.symmetric(
          vertical: CustomSizes.xs, horizontal: CustomSizes.xs),
      textStyle: TextStyle(
        fontSize: CustomSizes.fontSizeMd,
        color: CustomAppColors.dark.textPrimary,
        fontWeight: CustomSizes.fontWeightMedium,
      ),
    ),
  );
}
