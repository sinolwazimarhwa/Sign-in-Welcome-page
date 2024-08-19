import 'package:flutter/material.dart';

class NewScreen extends StatelessWidget {
  final String username;

  // Constructor to accept the username parameter
  NewScreen({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();  // This will take the user back to the previous screen
          },
        ),
      ),
      body: Center(
        child: Text(
          "Welcome, $username",
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
