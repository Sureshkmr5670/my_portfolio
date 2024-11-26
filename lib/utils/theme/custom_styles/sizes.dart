import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSizes {
  // Padding and margin sizes
  static double get xs => 4.0.w;
  static double get sm => 6.0.w;
  static double get md => 8.0.w;
  static double get lg => 12.0.w;
  static double get xl => 16.0.w;
  static double get xxl => 20.0.w;
  static double get xxxl => 24.0.w;

  // Icon sizes
  static double get iconXs => 12.0.w;
  static double get iconSm => 16.0.w;
  static double get iconMd => 20.0.w;
  static double get iconLg => 24.0.w;

  // Font Sizes
  static double get fontSizeSm => 14.0.sp;
  static double get fontSizeMd => 16.0.sp;
  static double get fontSizeLg => 18.0.sp;

  static double get titleLarge => 10.sp; // Adjusted based on body style
  static double get titleMedium => 8.sp; // Adjusted based on body style
  static double get titleSmall => 7.sp; // Adjusted based on body style

  static double get headlineLarge => 9.sp; // Adjusted based on body style
  static double get headlineMedium => 8.sp; // Adjusted based on body style
  static double get headlineSmall => 7.sp; // Adjusted based on body style

  static double get bodyLarge => 8.sp; // Used for main body text
  static double get bodyMedium =>
      5.sp; // Used for secondary body text or instructions
  static double get bodySmall =>
      3.sp; // Used for less important text (e.g., footnotes)

  static double get labelLarge => 9.sp; // Used for buttons and labels
  static double get labelMedium => 8.sp; // Used for small labels or taglines
  static double get labelSmall =>
      7.sp; // Used for very small labels or captions

  static double get displayLarge => 12.sp; // Adjusted based on body style
  static double get displayMedium => 10.sp; // Adjusted based on body style
  static double get displaySmall => 8.sp; // Adjusted based on body style

  // Font Weights
  static const FontWeight fontWeightLight = FontWeight.w300;
  static const FontWeight fontWeightRegular = FontWeight.w400;
  static const FontWeight fontWeightMedium = FontWeight.w500;
  static const FontWeight fontWeightSemiBold = FontWeight.w600;
  static const FontWeight fontWeightBold = FontWeight.w700;

  // Button Sizes
  static double get buttonHeight => 18.0.h;
  static double get buttonRadius => 14.0.r;
  static double get buttonWidth => 20.0.w;

  // AppBar height
  static double get appBarHeight => 56.0.h;

  // Image sizes
  static double get imageThumbSize => 80.0.w;

  // Default spacing between sections
  static double get defaultSpace => 24.0.h;
  static double get spaceBtwItems => 16.0.h;
  static double get spaceBtwSections => 32.0.h;

  // Border Radius
  static double get borderRadiusSm => 4.0.r;
  static double get borderRadiusMd => 8.0.r;
  static double get borderRadiusLg => 12.0.r;

  // Divider height
  static double get dividerHeight => 1.0.h;

  // Product item Dimensions
  static double get productImageSize => 120.0.w;
  static double get productImageRadius => 16.0.r;
  static double get productItemHeight => 160.0.h;

  // Input field
  static double get inputFieldRadius => 12.0.r;
  static double get spaceBtwInputFields => 16.0.h;

  static double get cardWidth100 => 100.0.w;
  static double get cardHeight100 => 100.0.w;
    static double get cardWidth150 => 150.0.w;
  static double get cardHeight150 => 150.0.w;

  // Card Sizes
  static double get cardRadiusLg => 16.0.r;
  static double get cardRadiusMd => 12.0.r;
  static double get cardRadiusSm => 10.0.r;
  static double get cardRadiusXs => 6.0.r;
  static double get cardElevation => 2.0.h;

  // Image Carousel height
  static double get imageCarouselHeight => 200.0.h;

  // Loading indicator size
  static double get loadingIndicatorSize => 36.0.w;

  // Grid view spacing
  static double get gridViewSpacing => 16.0.w;
}
