import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpHelper {
  static const String _baseURl = 'http://localhost';

  static Future<Map<String, dynamic>> get(String endpoint) async {
    try {
      final response = await http.get(Uri.parse('$_baseURl/$endpoint'));
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  static Future<Map<String, dynamic>> post(String endpoint) async {
    try {
      final response = await http.post(Uri.parse('$_baseURl/$endpoint'),
          headers: {'Content-Type': 'application/json'}, body: json.encode({}));
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  static Future<Map<String, dynamic>> put(
      String endpoint, Map<String, dynamic> body) async {
    try {
      final response = await http.put(Uri.parse('$_baseURl/$endpoint'),
          headers: {'Content-Type': 'application/json'}, body: json.encode({}));
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  static Future<Map<String, dynamic>> delete(String endpoint) async {
    try {
      final response = await http.delete(Uri.parse('$_baseURl/$endpoint'));
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  static Future<Map<String, dynamic>> patch(
      String endpoint, Map<String, dynamic> body) async {
    try {
      final response = await http.patch(Uri.parse('$_baseURl/$endpoint'),
          body: json.encode(body));
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  static Map<String, dynamic> _handleResponse(http.Response response) {
    // Check for a range of success status codes (200-299)
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var data = json.decode(response.body);
      switch (response.statusCode) {
        case 200: // OK
          // You can customize the response for a 200 status code if needed
          return data;
        case 201: // Created
          return {
            'message': 'Resource created successfully.',
            'data': data,
          };
        case 204: // No Content
          return {
            'message':
                'Operation completed successfully, but no content to return.',
          };
        // Add more cases for other success status codes if needed
        default:
          return data;
      }
    } else {
      // Handle client or server errors
      throw Exception('HTTP error ${response.statusCode}: ${response.body}');
    }
  }

  static Map<String, dynamic> _handleError(dynamic e) {
    // You can customize the error handling logic based on the type of exception
    print('An error occurred: $e'); // Logging the error
    return {'error': 'An error occurred: $e'};
  }
}
