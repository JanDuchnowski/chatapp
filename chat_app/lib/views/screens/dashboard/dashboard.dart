import 'package:chat_app/views/screens/chat_screen/widgets/text_prompt.dart';
import 'package:chat_app/views/screens/conversation/screens/conversation_screen.dart';
import 'package:chat_app/views/screens/dashboard/dashboard_card.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.withOpacity(0.1),
        // appBar: DashboardAppBar(),
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
                              builder: (context) =>
                                  const ConversationScreen()));
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      Expanded(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          color: Colors.white,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Favorites",
                                    style: TextStyle(fontSize: 24)),
                                Expanded(
                                  child: ListView.separated(
                                    padding: const EdgeInsets.all(0),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                      height: 8,
                                    ),
                                    // shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return DashboardCard(
                                          title: 'Item $index');
                                    },
                                    itemCount: 8,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          color: Colors.white,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("History",
                                    style: TextStyle(fontSize: 24)),
                                Expanded(
                                  child: ListView.separated(
                                    padding: const EdgeInsets.all(0),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                      height: 8,
                                    ),
                                    //shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return DashboardCard(
                                          title: 'Item $index');
                                    },
                                    itemCount: 8,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 32.0, top: 16, left: 8),
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
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
