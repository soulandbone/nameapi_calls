import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> users = [];

  final String url = 'https://randomuser.me/api/?results=10';
  void fetchUsers() async {
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    setState(() {
      users = json['results'];
    });
    print(json['results']);
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
        itemBuilder: (context, index) => Card(
          elevation: 5,
          color: Colors.black38,
          child: ListTile(
            leading: CircleAvatar(
                foregroundImage:
                    NetworkImage(users[index]['picture']['medium'])),
            title: Text(users[index]['name']['first']),
            subtitle: Text(users[index]['email']),
          ),
        ),
      ),
    );
  }
}
