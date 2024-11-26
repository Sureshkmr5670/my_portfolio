import 'dart:io';

import 'package:battery_plus/battery_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DeviceUtils {
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus();
  }

  static Future<void> setStatusBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: color));
  }

  static bool isLandscapeOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom == 0;
  }

  static bool isPortraitOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom != 0;
  }

  static void setFullScreen(bool enable) {
    SystemChrome.setEnabledSystemUIMode(
        enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);
  }

  static double getScreenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static double getScreenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double getPixelRation() {
    return MediaQuery.of(Get.context!).devicePixelRatio;
  }

  static double getStatusBarHeight() {
    return MediaQuery.of(Get.context!).padding.top;
  }

  static double getBottomNavigationBarHeight() {
    return MediaQuery.of(Get.context!).padding.bottom;
  }

  static double getAppBarHeight() {
    return kToolbarHeight;
  }

  static double getKeyboardHeight() {
    final viewInsets = View.of(Get.context!).viewInsets;
    return viewInsets.bottom;
  }

  static Future<bool> isKeyBoardVisible() {
    final viewInsets = View.of(Get.context!).viewInsets;
    return Future.value(viewInsets.bottom > 0);
  }

  static Future<bool> isPhysicalDevice() async {
    return defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS;
  }

  static void vibrate(Duration duration) {
    HapticFeedback.vibrate();
    Future.delayed(duration, () => HapticFeedback.vibrate());
  }

  static Future<void> setPreferedOrientation(
      List<DeviceOrientation> orientations) async {
    return SystemChrome.setPreferredOrientations(orientations);
  }

  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  static void showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  static Future<bool> hasInternetConnections() async {
    try {
      final result = await InternetAddress.lookup('www.google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  static bool isIOS() {
    return Platform.isIOS;
  }

  static bool isAndroid() {
    return Platform.isAndroid;
  }

  static bool isDarkMode(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    return brightness == Brightness.dark;
  }

  static Locale getCurrentLocale(BuildContext context) {
    return Localizations.localeOf(context);
  }

  static Future<int> getBatteryLevel() async {
    final battery = await Battery().batteryLevel;
    return battery;
  }

  static Future<String> getDeviceModel() async {
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      return androidInfo.model;
    } else if (Platform.isIOS) {
      final iosInfo = await DeviceInfoPlugin().iosInfo;
      return iosInfo.utsname.machine;
    }
    return 'Unknown'; // Unsupported platform
  }

  static void launchUrl(String url) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      launchIOSApp(url);
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      launchAndroidApp(url);
    } else if (kIsWeb) {
      launchWebApp(url);
    } else {
      throw Exception('Unsupported platform');
    }
  }

  static void launchIOSApp(String url) async {
    if (await canLaunchUrl(url as Uri)) {
      launchUrl(url);
    } else {
      throw Exception('Could not launch app on iOS: $url');
    }
  }

  static void launchAndroidApp(String url) async {
    if (await canLaunchUrl(url as Uri)) {
      launchUrl(url);
    } else {
      throw Exception('Could not launch app on Android: $url');
    }
  }

  static void launchWebApp(String url) async {
    if (await canLaunchUrl(url as Uri)) {
      launchUrl(url);
    } else {
      throw Exception('Could not launch app on web: $url');
    }
  }
}
