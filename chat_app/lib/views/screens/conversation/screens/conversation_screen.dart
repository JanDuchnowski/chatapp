import 'package:chat_app/bloc/chat/chat_bloc.dart';
import 'package:chat_app/views/screens/chat_screen/widgets/text_prompt.dart';
import 'package:chat_app/views/screens/conversation/widgets/conversation_bubble.dart';
import 'package:chat_app/views/screens/dashboard/dashboard_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversationScreen extends StatelessWidget {
  final TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        List<String> messageHistory = state.messageHistory;
        List<String> answerHistory = state.answerHistory;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Chat Window'),
          ),
          body: Column(
            children: [
              for (int i = 0;
                  i < messageHistory.length || i < answerHistory.length;
                  i++)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: ConversationBubble(
                          title: messageHistory.length > i
                              ? messageHistory[i]
                              : '',
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ConversationBubble(
                          title:
                              answerHistory.length > i ? answerHistory[i] : '',
                          isDarkMode: true,
                          isAnimated: true,
                        ),
                      ),
                    ],
                  ),
                )
            ],
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(
                left: 8.0, right: 8, bottom: kIsWeb ? 110 : 70),
            child: TextPrompt(
              textController: textController,
            ),
          ),
        );
      },
    );
  }
}
