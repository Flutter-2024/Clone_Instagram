import 'dart:convert';

import 'package:http/http.dart' as http;

import '../data/user.dart';

class Service {
  static const String url = 'https://jsonplaceholder.typicode.com/users';
  static Future<List<User>> getUserList() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return parseUserList(response.body);
      } else {
        throw Exception('Failed to load users');
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  static List<User> parseUserList(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<User>((json) => User.fromJson(json)).toList();
  }
}
