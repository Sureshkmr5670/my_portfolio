import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import 'text_theme.dart';

class CustomAppBarTheme {
  CustomAppBarTheme._();

  static final lightAppBarTheme = AppBarTheme(
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 0,
      backgroundColor: CustomAppColors.light.appBarColor,
      surfaceTintColor: CustomAppColors.light.surfaceTintColor,
      iconTheme:
          IconThemeData(color: CustomAppColors.light.iconThemeColor, size: 24),
      actionsIconTheme: IconThemeData(
          color: CustomAppColors.light.actionsIconTheme, size: 24),
      titleTextStyle: CustomTextTheme.lightTextTheme.titleLarge);
  static final darkAppBarTheme = AppBarTheme(
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 0,
      backgroundColor: CustomAppColors.dark.appBarColor,
      surfaceTintColor: CustomAppColors.dark.surfaceTintColor,
      iconTheme:
          IconThemeData(color: CustomAppColors.dark.iconThemeColor, size: 24),
      actionsIconTheme:
          IconThemeData(color: CustomAppColors.dark.actionsIconTheme, size: 24),
      titleTextStyle: CustomTextTheme.darkTextTheme.titleLarge);
}
