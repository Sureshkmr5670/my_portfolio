import 'package:intl/intl.dart';

class Formatter {
  static String formatDate(DateTime date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_IN', symbol: '₹').format(amount);
  }

  static String formatPhoneNumber(String phoneNumber) {
    // Remove any non-digit characters (e.g., spaces, dashes)
    final cleanedNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // Ensure the cleaned number has at least 10 digits
    if (cleanedNumber.length < 10) {
      return 'Invalid phone number';
    }

    // Take the last 10 digits
    final last10Digits = cleanedNumber.substring(cleanedNumber.length - 10);

    // Format as (XXX) XXX-XXXX
    final formattedNumber =
        '(${last10Digits.substring(0, 3)}) ${last10Digits.substring(3, 6)}-${last10Digits.substring(6)}';

    return formattedNumber;
  }
}
