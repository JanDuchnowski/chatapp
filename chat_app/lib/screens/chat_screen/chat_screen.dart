import 'package:chat_app/bloc/chat/chat_bloc.dart';
import 'package:chat_app/constant_strings.dart';
import 'package:chat_app/screens/chat_screen/widgets/chat_message.dart';
import 'package:chat_app/utils/build_context_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BuildContextData ctxData = BuildContextData(context);
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if(state.messageHistory.isNotEmpty)
              ListView.builder(
                itemBuilder: (context, index) {
                  return ChatMessage(
                    text: state.messageHistory[index],
                    index: index,
                  );
                },
                itemCount: state.messageHistory.length,
                shrinkWrap: true,
              ),
              const Text(ConstantStrings.WELCOME_USER),
              SizedBox(
                height: ctxData.screenHeight * 0.02,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: _buildTextComposer(context),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTextComposer(BuildContext context) {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).canvasColor),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: (text) {},
                decoration: const InputDecoration.collapsed(
                  hintText: 'Type a message',
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {
                context
                    .read<ChatBloc>()
                    .add(NewMessageEvent(message: _textController.text));
                _textController.clear();
              },
            ),
          ],
        ),
      ),
    );
  }
}
