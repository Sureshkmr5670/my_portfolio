import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPadding {
  // Symmetric Paddings
  static EdgeInsets get symmetricXS => EdgeInsets.symmetric(horizontal: 4.0.w, vertical: 4.0.h);
  static EdgeInsets get symmetricSM => EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 8.0.h);
  static EdgeInsets get symmetricMD => EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 12.0.h);
  static EdgeInsets get symmetricLG => EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.0.h);
  static EdgeInsets get symmetricXL => EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.0.h);
  static EdgeInsets get symmetricXXL => EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 24.0.h);

  // Horizontal Only Paddings
  static EdgeInsets get horizontalXS => EdgeInsets.symmetric(horizontal: 4.0.w);
  static EdgeInsets get horizontalSM => EdgeInsets.symmetric(horizontal: 8.0.w);
  static EdgeInsets get horizontalMD => EdgeInsets.symmetric(horizontal: 12.0.w);
  static EdgeInsets get horizontalLG => EdgeInsets.symmetric(horizontal: 16.0.w);
  static EdgeInsets get horizontalXL => EdgeInsets.symmetric(horizontal: 20.0.w);
  static EdgeInsets get horizontalXXL => EdgeInsets.symmetric(horizontal: 24.0.w);

  // Vertical Only Paddings
  static EdgeInsets get verticalXS => EdgeInsets.symmetric(vertical: 4.0.h);
  static EdgeInsets get verticalSM => EdgeInsets.symmetric(vertical: 8.0.h);
  static EdgeInsets get verticalMD => EdgeInsets.symmetric(vertical: 12.0.h);
  static EdgeInsets get verticalLG => EdgeInsets.symmetric(vertical: 16.0.h);
  static EdgeInsets get verticalXL => EdgeInsets.symmetric(vertical: 20.0.h);
  static EdgeInsets get verticalXXL => EdgeInsets.symmetric(vertical: 24.0.h);

  // All Side Paddings
  static EdgeInsets get allXS => EdgeInsets.all(4.0.r);
  static EdgeInsets get allSM => EdgeInsets.all(8.0.r);
  static EdgeInsets get allMD => EdgeInsets.all(12.0.r);
  static EdgeInsets get allLG => EdgeInsets.all(16.0.r);
  static EdgeInsets get allXL => EdgeInsets.all(20.0.r);
  static EdgeInsets get allXXL => EdgeInsets.all(24.0.r);

  // Only Left Paddings
  static EdgeInsets get leftXS => EdgeInsets.only(left: 4.0.w);
  static EdgeInsets get leftSM => EdgeInsets.only(left: 8.0.w);
  static EdgeInsets get leftMD => EdgeInsets.only(left: 12.0.w);
  static EdgeInsets get leftLG => EdgeInsets.only(left: 16.0.w);
  static EdgeInsets get leftXL => EdgeInsets.only(left: 20.0.w);

  // Only Right Paddings
  static EdgeInsets get rightXS => EdgeInsets.only(right: 4.0.w);
  static EdgeInsets get rightSM => EdgeInsets.only(right: 8.0.w);
  static EdgeInsets get rightMD => EdgeInsets.only(right: 12.0.w);
  static EdgeInsets get rightLG => EdgeInsets.only(right: 16.0.w);
  static EdgeInsets get rightXL => EdgeInsets.only(right: 20.0.w);

  // Only Top Paddings
  static EdgeInsets get topXS => EdgeInsets.only(top: 4.0.h);
  static EdgeInsets get topSM => EdgeInsets.only(top: 8.0.h);
  static EdgeInsets get topMD => EdgeInsets.only(top: 12.0.h);
  static EdgeInsets get topLG => EdgeInsets.only(top: 16.0.h);
  static EdgeInsets get topXL => EdgeInsets.only(top: 20.0.h);

  // Only Bottom Paddings
  static EdgeInsets get bottomXS => EdgeInsets.only(bottom: 4.0.h);
  static EdgeInsets get bottomSM => EdgeInsets.only(bottom: 8.0.h);
  static EdgeInsets get bottomMD => EdgeInsets.only(bottom: 12.0.h);
  static EdgeInsets get bottomLG => EdgeInsets.only(bottom: 16.0.h);
  static EdgeInsets get bottomXL => EdgeInsets.only(bottom: 20.0.h);

  // Custom Screen Specific Paddings
  static EdgeInsets get screenPadding => EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 24.0.h);
  static EdgeInsets get screenHorizontalPadding => EdgeInsets.symmetric(horizontal: 16.0.w);
  static EdgeInsets get screenVerticalPadding => EdgeInsets.symmetric(vertical: 24.0.h);

  // Form Field Paddings
  static EdgeInsets get inputFieldPadding => EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 8.0.h);
  static EdgeInsets get buttonPadding => EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 12.0.h);

  // List View Paddings
  static EdgeInsets get listViewPadding => EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.0.h);
  static EdgeInsets get listTilePadding => EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 8.0.h);

  // Card Paddings
  static EdgeInsets get cardPadding => EdgeInsets.all(16.0.r);
  static EdgeInsets get cardContentPadding => EdgeInsets.all(12.0.r);

  // Dialog Paddings
  static EdgeInsets get dialogPadding => EdgeInsets.all(24.0.r);
  static EdgeInsets get dialogContentPadding => EdgeInsets.all(16.0.r);
}
