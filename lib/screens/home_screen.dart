import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  final String url = 'https://randomuser.me/api/?results=10';
  void fetchUsers() async {
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final results = json['results'] as List<dynamic>;

    setState(() {
      users = results.map((e) {
        var name = e['name'];
        var picture = e['picture'];
        return User(
            gender: e['gender'],
            mail: e['email'],
            cell: e['cell'],
            nat: e['nat'],
            userName: UserName(
                title: name['title'], first: name['first'], last: name['last']),
            profileImage: ProfileImage(thumbnail: picture['thumbnail']));
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Name API call')),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_downward),
        onPressed: () => fetchUsers(),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            color: Colors.lightBlueAccent,
            child: ListTile(
              leading: CircleAvatar(
                  foregroundImage:
                      NetworkImage(users[index].profileImage.thumbnail)),
              title: Text(
                  '${users[index].userName.title}. ${users[index].userName.first} ${users[index].userName.last} '),
              subtitle: Text(users[index].mail),
              trailing: Text(users[index].nat),
            ),
          );
        },
      ),
    );
  }
}
