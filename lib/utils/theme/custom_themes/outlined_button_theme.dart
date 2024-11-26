import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../custom_styles/sizes.dart';

class CustomOutlinedButtonTheme {
  CustomOutlinedButtonTheme._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          elevation: 0,
          foregroundColor: CustomAppColors.light.textPrimary,
          side: BorderSide(color: CustomAppColors.light.secondaryColor),
          textStyle: TextStyle(
            fontSize: CustomSizes.fontSizeMd,
            color: CustomAppColors.light.textPrimary,
            fontWeight: CustomSizes.fontWeightMedium,
          ),
          padding:  EdgeInsets.symmetric(
              vertical: CustomSizes.xl, horizontal: CustomSizes.xl),
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(CustomSizes.borderRadiusLg))));
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          elevation: 0,
          foregroundColor: CustomAppColors.dark.textPrimary,
          side: BorderSide(color: CustomAppColors.dark.secondaryColor),
          textStyle: TextStyle(
            fontSize: CustomSizes.fontSizeMd,
            color: CustomAppColors.dark.textPrimary,
            fontWeight: CustomSizes.fontWeightMedium,
          ),
          padding:  EdgeInsets.symmetric(
              vertical: CustomSizes.xl, horizontal: CustomSizes.xl),
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(CustomSizes.borderRadiusLg))));
}
