import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';
import '../models/username_model.dart';
import '../models/userpicture_model.dart';

class UserApi {
  static Future<List<User>> fetchUsers() async {
    const String url = 'https://randomuser.me/api/?results=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final results = json['results'] as List<dynamic>;
    final users = results.map((e) {
      final name = UserName(
          title: e['name']['title'],
          first: e['name']['first'],
          last: e['name']['last']);
      final picture = e['picture']['thumbnail'];
      return User(
          gender: e['gender'],
          mail: e['email'],
          cell: e['cell'],
          nat: e['nat'],
          userName: name,
          profileImage: ProfileImage(thumbnail: picture));
    }).toList();
    return users;
  }
}
