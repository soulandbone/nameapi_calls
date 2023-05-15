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

  String get fullName {
    return '${userName.title}. ${userName.first} ${userName.last} ';
  }
}
