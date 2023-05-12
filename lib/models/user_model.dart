import './userpicture_model.dart';
import './username_model.dart';

class User {
  final String gender;
  final String mail;
  final String cell;
  final String nat;
  final UserName userName;
  final ProfileImage profileImage;

  User({
    required this.gender,
    required this.mail,
    required this.cell,
    required this.nat,
    required this.userName,
    required this.profileImage,
  });
}
