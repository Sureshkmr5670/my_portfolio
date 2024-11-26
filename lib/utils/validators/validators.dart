import 'package:flutter/material.dart';

class Validators {
  static bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static bool validatePassword(String password) {
    // Check if the password has at least 8 characters
    if (password.length < 8) {
      return false;
    }

    // Check if the password contains at least one uppercase letter
    bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
    if (!hasUppercase) {
      return false;
    }

    // Check if the password contains at least one lowercase letter
    bool hasLowercase = password.contains(RegExp(r'[a-z]'));
    if (!hasLowercase) {
      return false;
    }

    // Check if the password contains at least one numeric character
    bool hasDigit = password.contains(RegExp(r'[0-9]'));
    if (!hasDigit) {
      return false;
    }

    // Check if the password contains at least one special character
    bool hasSpecialCharacter =
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    if (!hasSpecialCharacter) {
      return false;
    }

    // If all conditions are met, return true
    return true;
  }
}
