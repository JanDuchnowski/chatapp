import 'package:chat_app/bloc/chat/chat_bloc.dart';
import 'package:chat_app/constant_strings.dart';
import 'package:chat_app/views/screens/chat_screen/widgets/product_card.dart';
import 'package:chat_app/utils/build_context_data.dart';
import 'package:chat_app/views/screens/chat_screen/widgets/text_prompt.dart';
import 'package:chat_app/views/screens/conversation/screens/conversation_screen.dart';
import 'package:chat_app/views/screens/dashboard/dashboard_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController textController = TextEditingController();

  bool answerDisplayed = false;

  void onFinished() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        answerDisplayed = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final BuildContextData ctxData = BuildContextData(context);
    return BlocConsumer<ChatBloc, ChatState>(
      listener: (context, state) {
        if (state.status == ChatStateStatus.fetched) {}
      },
      builder: (context, state) {
        return state.messageHistory.isEmpty
            ? SafeArea(
                child: Scaffold(
                  body: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 100),
                              child: Column(
                                children: [
                                  const Text(
                                    ConstantStrings.appTitle,
                                    style: TextStyle(
                                      fontFamily: 'Jockey One',
                                      fontSize: 64,
                                      fontWeight: FontWeight.w400,
                                      height: 89 / 64,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: answerDisplayed
                                        ? () {
                                            print("Tapped bottom prompt");
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const ConversationScreen()));
                                          }
                                        : null,
                                    child: TextPrompt(
                                      textController: textController,
                                      enabled: !answerDisplayed,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : ConversationScreen();
      },
    ); //szyc
  }
}
