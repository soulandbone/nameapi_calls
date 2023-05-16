import 'package:nameapi_call/models/user_dob.dart';
import 'package:nameapi_call/models/user_location.dart';

import './userpicture_model.dart';
import './username_model.dart';

class User {
  final String gender;
  final String mail;
  final String cell;
  final String nat;
  final UserName userName;
  final ProfileImage profileImage;
  final UserLocation location;
  final UserDob dob;

  User({
    required this.gender,
    required this.mail,
    required this.cell,
    required this.nat,
    required this.userName,
    required this.profileImage,
    required this.location,
    required this.dob,
  });

  factory User.fromMap(Map<String, dynamic> e) {
    final name = UserName.fromMap(e);
    final dob = UserDob.fromMap(e);
    final profileImage = ProfileImage(thumbnail: e['picture']['thumbnail']);
    final location = UserLocation.fromMap(e);
    return User(
        gender: e['gender'],
        mail: e['email'],
        cell: e['cell'],
        nat: e['nat'],
        userName: name,
        profileImage: profileImage,
        location: location,
        dob: dob);
  }

  String get fullName {
    return '${userName.title}. ${userName.first} ${userName.last} ';
  }
}
