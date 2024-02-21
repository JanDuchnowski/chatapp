import 'package:chat_app/bloc/navigation/navigation_bloc.dart';
import 'package:chat_app/views/screens/chat_screen/chat_screen.dart';
import 'package:chat_app/views/screens/chat_screen/widgets/text_prompt.dart';
import 'package:chat_app/views/screens/dashboard/dashboard_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text('Hello User!', style: TextStyle(fontSize: 24)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextPrompt(
                  textController: TextEditingController(),
                  onTap: () {
                    print("Tapped");
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ChatScreen()));
                    // context
                    //     .read<NavigationBloc>()
                    //     .add(const NavigationEvent(index: 0));
                    print("Tapped");
                  },
                ),
              ),
              const SizedBox(height: 16),
              const DashboardCard(
                  title: "Last searches", items: ["Item 1", "Item 2"]),
              const SizedBox(height: 16),
              const DashboardCard(
                  title: "Favourites", items: ["Item 1", "Item 2"]),
            ],
          ),
        ),
      ),
    );
  }
}
