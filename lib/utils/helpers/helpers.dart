import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Helpers {
  static String capitalizeFirstLetter(String text) {
    return text[0].toUpperCase() + text.substring(1);
  }

  static String convertToCamelCase(String text) {
    List<String> words = text.split(' ');
    String result = words[0].toLowerCase();
    for (int i = 1; i < words.length; i++) {
      result += words[i][0].toUpperCase() + words[i].substring(1).toLowerCase();
    }
    return result;
  }


  static int generateRandomNumber(int min, int max) {
    final random = Random();
    return min + random.nextInt(max - min);
  }

  static String generateRandomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    return List.generate(length, (index) => chars[random.nextInt(chars.length)])
        .join();
  }

  static int calculateAge(DateTime birthDate) {
    final now = DateTime.now();
    var age = now.year - birthDate.year;
    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  static List<T> shuffleList<T>(List<T> list) {
    final random = Random();
    for (int i = list.length - 1; i > 0; i--) {
      int j = random.nextInt(i + 1);
      T temp = list[i];
      list[i] = list[j];
      list[j] = temp;
    }
    return list;
  }

  static Color? getColor(String value) {
    switch (value) {
      case 'red':
        return Colors.red;
      case 'blue':
        return Colors.blue;
      case 'green':
        return Colors.green;
      case 'orange':
        return Colors.orange;
      case 'purple':
        return Colors.purple;
      case 'teal':
        return Colors.teal;
      case 'yellow':
        return Colors.yellow;
      case 'pink':
        return Colors.pink;
      case 'cyan':
        return Colors.cyan;
      case 'indigo':
        return Colors.indigo;
      default:
        return Colors.black;
    }
  }

  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  static void showAlert(String title, String message) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  static String truncateText(String text, int maxLength) {
    return text.length <= maxLength
        ? text
        : '${text.substring(0, maxLength)}...';
  }



  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  // static Widget wrapWidgets(List<Widget> widgets, Widget parentWidget) {
  //   return Column(
  //     children: widgets.map((widget) => parentWidget(child: widget)).toList(),
  //   );
  // }
}
