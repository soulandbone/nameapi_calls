import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../services/user_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  void fetchUsers() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }

  @override
  void initState() {
    fetchUsers();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Name API call')),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return Card(
            elevation: 5,
            color: Colors.lightBlueAccent,
            child: ListTile(
              leading: CircleAvatar(
                  foregroundImage: NetworkImage(user.profileImage.thumbnail)),
              title: Text(
                  '${user.userName.title}. ${user.userName.first} ${user.userName.last} '),
              subtitle: Text(user.mail),
              trailing: Text(user.nat),
            ),
          );
        },
      ),
    );
  }
}
