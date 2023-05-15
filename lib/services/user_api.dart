import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nameapi_call/models/user_dob.dart';
import 'package:nameapi_call/models/user_location.dart';

import '../models/user_model.dart';
import '../models/username_model.dart';
import '../models/userpicture_model.dart';

class UserApi {
  static Future<List<User>> fetchUsers() async {
    const String url = 'https://randomuser.me/api/?results=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final results = json['results'] as List<
        dynamic>; // so that it does not gets confused and knows that this is a List of Maps.
    final users = results.map((e) {
      final name = UserName(
          title: e['name']['title'],
          first: e['name']['first'],
          last: e['name']['last']);
      final picture = e['picture']['thumbnail'];
      final date = e['dob']['date'];
      final dob = UserDob(age: e['dob']['age'], date: DateTime.parse(date));
      final location = UserLocation(
        street: LocationStreet(
            name: e['location']['street']['name'],
            number: e['location']['street']['number'].toString()),
        city: e['location']['city'],
        state: e['location']['state'],
        country: e['location']['country'],
        postcode: e['location']['postcode'].toString(),
        coordinates: LocationCoordinates(
            latitude: e['location']['coordinates']['latitude'],
            longitude: e['location']['coordinates']['longitude']),
        timeZone: LocationTimeZone(
            offset: e['location']['timezone']['offset'],
            description: e['location']['timezone']['description']),
      );
      return User(
          gender: e['gender'],
          mail: e['email'],
          cell: e['cell'],
          nat: e['nat'],
          userName: name,
          profileImage: ProfileImage(thumbnail: picture),
          location: location,
          dob: dob);
    }).toList();
    return users;
  }
}
