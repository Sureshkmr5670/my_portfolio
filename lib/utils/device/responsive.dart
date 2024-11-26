import 'package:flutter/material.dart';

enum ScreenType {
  mobile,
  mobileLarge,
  tablet,
  tabletLarge,
  desktop,
  desktopLarge,
}

class Responsive {
  static ScreenType getScreenType(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    if (width >= 1200) {
      return ScreenType.desktopLarge;
    } else if (width >= 1024) {
      return ScreenType.desktop;
    } else if (width >= 768) {
      return ScreenType.tabletLarge;
    } else if (width >= 600) {
      return ScreenType.tablet;
    } else if (width >= 480) {
      return ScreenType.mobileLarge;
    } else {
      return ScreenType.mobile;
    }
  }

  static bool isMobile(BuildContext context) {
    return getScreenType(context) == ScreenType.mobile;
  }

  static bool isMobileLarge(BuildContext context) {
    return getScreenType(context) == ScreenType.mobileLarge;
  }

  static bool isTablet(BuildContext context) {
    return getScreenType(context) == ScreenType.tablet;
  }

  static bool isTabletLarge(BuildContext context) {
    return getScreenType(context) == ScreenType.tabletLarge;
  }

  static bool isDesktop(BuildContext context) {
    return getScreenType(context) == ScreenType.desktop;
  }

  static bool isDesktopLarge(BuildContext context) {
    return getScreenType(context) == ScreenType.desktopLarge;
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
