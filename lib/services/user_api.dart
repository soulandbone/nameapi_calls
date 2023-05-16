import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';

class UserApi {
  static Future<List<User>> fetchUsers() async {
    const String url = 'https://randomuser.me/api/?results=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final results = json['results'] as List<
        dynamic>; // so that it doesnt gets confused and knows that this is a List of Maps.
    final users = results.map((e) {
      return User.fromMap(e);
    }).toList();
    return users;
  }
}
