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

class UserName {
  final String title;
  final String first;
  final String last;

  UserName({required this.title, required this.first, required this.last});
}

class ProfileImage {
  final String large;
  final String medium;
  final String thumbnail;

  ProfileImage(
      {required this.large, required this.medium, required this.thumbnail});
}
