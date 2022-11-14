import 'dart:developer';

import 'package:http/http.dart' as http;

const String baseUrl = 'https://pub.dev/packages';

class HttpService {
  static Future<String?> get() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) return response.body;
    } catch (e) {
      log('HttpService got fucked $e');
    }
    return null;
  }
}
