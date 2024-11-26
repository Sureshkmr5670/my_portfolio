import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSpacing {
  // Vertical Spacing
  static SizedBox get verticalSpaceXXS => SizedBox(height: 2.0.h);
  static SizedBox get verticalSpaceXS => SizedBox(height: 4.0.h);
  static SizedBox get verticalSpaceSM => SizedBox(height: 8.0.h);
  static SizedBox get verticalSpaceMD => SizedBox(height: 12.0.h);
  static SizedBox get verticalSpaceLG => SizedBox(height: 16.0.h);
  static SizedBox get verticalSpaceXL => SizedBox(height: 20.0.h);
  static SizedBox get verticalSpaceXXL => SizedBox(height: 24.0.h);
  static SizedBox get verticalSpace30 => SizedBox(height: 30.0.h);
  static SizedBox get verticalSpace32 => SizedBox(height: 32.0.h);
  static SizedBox get verticalSpace36 => SizedBox(height: 36.0.h);
  static SizedBox get verticalSpace40 => SizedBox(height: 40.0.h);
  static SizedBox get verticalSpace48 => SizedBox(height: 48.0.h);
  static SizedBox get verticalSpace50 => SizedBox(height: 50.0.h);
  static SizedBox get verticalSpace64 => SizedBox(height: 64.0.h);
  static SizedBox get verticalSpace80 => SizedBox(height: 80.0.h);
  static SizedBox get verticalSpace100 => SizedBox(height: 100.0.h);

  // Horizontal Spacing
  static SizedBox get horizontalSpaceXXS => SizedBox(width: 2.0.w);
  static SizedBox get horizontalSpaceXS => SizedBox(width: 4.0.w);
  static SizedBox get horizontalSpaceSM => SizedBox(width: 8.0.w);
  static SizedBox get horizontalSpaceMD => SizedBox(width: 12.0.w);
  static SizedBox get horizontalSpaceLG => SizedBox(width: 16.0.w);
  static SizedBox get horizontalSpaceXL => SizedBox(width: 20.0.w);
  static SizedBox get horizontalSpaceXXL => SizedBox(width: 24.0.w);
  static SizedBox get horizontalSpace30 => SizedBox(width: 30.0.w);
  static SizedBox get horizontalSpace32 => SizedBox(width: 32.0.w);
  static SizedBox get horizontalSpace36 => SizedBox(width: 36.0.w);
  static SizedBox get horizontalSpace40 => SizedBox(width: 40.0.w);
  static SizedBox get horizontalSpace48 => SizedBox(width: 48.0.w);
  static SizedBox get horizontalSpace50 => SizedBox(width: 50.0.w);
  static SizedBox get horizontalSpace64 => SizedBox(width: 64.0.w);
  static SizedBox get horizontalSpace80 => SizedBox(width: 80.0.w);
  static SizedBox get horizontalSpace100 => SizedBox(width: 100.0.w);

  // Form Spacing
  static SizedBox get formFieldSpacing => SizedBox(height: 16.0.h);
  static SizedBox get formSectionSpacing => SizedBox(height: 32.0.h);
  
  // List Item Spacing
  static SizedBox get listItemSpacing => SizedBox(height: 12.0.h);
  static SizedBox get listSectionSpacing => SizedBox(height: 24.0.h);

  // Card Spacing
  static SizedBox get cardItemSpacing => SizedBox(height: 8.0.h);
  static SizedBox get cardSectionSpacing => SizedBox(height: 16.0.h);

  // Button Spacing
  static SizedBox get buttonSpacing => SizedBox(width: 8.0.w);
  static SizedBox get buttonGroupSpacing => SizedBox(height: 16.0.h);

  // Dialog Spacing
  static SizedBox get dialogItemSpacing => SizedBox(height: 12.0.h);
  static SizedBox get dialogButtonSpacing => SizedBox(height: 24.0.h);

  // Custom Method for Dynamic Spacing
  static SizedBox verticalSpace(double height) => SizedBox(height: height.h);
  static SizedBox horizontalSpace(double width) => SizedBox(width: width.w);

  // Screen Section Spacing
  static SizedBox get screenTopSpacing => SizedBox(height: 20.0.h);
  static SizedBox get screenBottomSpacing => SizedBox(height: 32.0.h);
  static SizedBox get screenSectionSpacing => SizedBox(height: 40.0.h);

  // Navigation Spacing
  static SizedBox get navigationItemSpacing => SizedBox(width: 8.0.w);
  static SizedBox get navigationSectionSpacing => SizedBox(height: 16.0.h);

  // Content Grouping Spacing
  static SizedBox get contentGroupSpacing => SizedBox(height: 24.0.h);
  static SizedBox get contentItemSpacing => SizedBox(height: 12.0.h);

  // Grid Spacing
  static SizedBox get gridItemSpacing => SizedBox(height: 16.0.h);
  static SizedBox get gridRowSpacing => SizedBox(height: 24.0.h);
}
