import 'package:chat_app/views/screens/chat_screen/widgets/text_prompt.dart';
import 'package:chat_app/views/screens/conversation/screens/conversation_screen.dart';
import 'package:chat_app/views/screens/dashboard/dashboard_card.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.withOpacity(0.1),
        body: SizedBox(
          height: MediaQuery.of(context).size.height - 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                color: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 32.0, top: 16, left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Hello User!', style: TextStyle(fontSize: 24)),
                      const SizedBox(height: 16),
                      TextPrompt(
                        textController: TextEditingController(),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ConversationScreen()));
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      color: Colors.white,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        // height: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Favorites",
                                style: TextStyle(fontSize: 24)),
                            SizedBox(
                              height: 220,
                              child: ListView.separated(
                                padding: const EdgeInsets.all(0),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  height: 8,
                                ),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return DashboardCard(title: 'Item $index');
                                },
                                itemCount: 8,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      color: Colors.white,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        // height: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("History",
                                style: TextStyle(fontSize: 24)),
                            SizedBox(
                              height: 220,
                              child: ListView.separated(
                                padding: const EdgeInsets.all(0),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  height: 8,
                                ),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return DashboardCard(title: 'Item $index');
                                },
                                itemCount: 8,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
