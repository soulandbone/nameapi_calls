class UserDob {
  final int age;
  final DateTime date;

  UserDob({required this.age, required this.date});

  factory UserDob.fromMap(Map<String, dynamic> e) {
    return UserDob(age: e['age'], date: DateTime.parse(e['date']));
  }
}
