import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Hello User!', style: TextStyle(fontSize: 24)),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Account Information', style: TextStyle(fontSize: 24)),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Name: John Doe', style: TextStyle(fontSize: 24)),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Email', style: TextStyle(fontSize: 24)),
          ),
        ],
      )),
    );
  }
}
