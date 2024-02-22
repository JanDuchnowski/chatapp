import 'package:chat_app/bloc/navigation/navigation_bloc.dart';
import 'package:chat_app/views/screens/chat_screen/chat_screen.dart';
import 'package:chat_app/views/screens/chat_screen/widgets/text_prompt.dart';
import 'package:chat_app/views/screens/dashboard/dashboard_card.dart';
import 'package:chat_app/views/screens/favorites/favorites_screen.dart';
import 'package:chat_app/views/screens/history/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text('Hello User!', style: TextStyle(fontSize: 24)),
              ),
              TextPrompt(
                textController: TextEditingController(),
                onTap: () {
                  print("Tapped");
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ChatScreen()));

                  print("Tapped");
                },
              ),
              const SizedBox(height: 16),
              SizedBox(
                  // height: 200,
                  child: SingleChildScrollView(
                      child: SizedBox(height: 300, child: HistoryScreen()))),
              const SizedBox(height: 16),
              SizedBox(
                  // height: 200,
                  child: SingleChildScrollView(
                      child: SizedBox(
                          height: 300, child: const FavoritesScreen()))),
            ],
          ),
        ),
      ),
    );
  }
}
