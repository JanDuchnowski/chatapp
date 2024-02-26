import 'package:chat_app/bloc/chat/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextPrompt extends StatelessWidget {
  const TextPrompt(
      {super.key,
      required this.textController,
      this.onTap,
      this.enabled = true});

  final TextEditingController textController;
  final Function? onTap;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      // margin: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black),
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                enabled: enabled,
                readOnly: enabled ? false : true,
                focusNode: FocusNode(),
                onTap: onTap != null ? () => onTap : null,
                controller: textController,
                onSubmitted: (text) {},
                decoration: const InputDecoration.collapsed(
                  hintText: 'Type a message',
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {
                if (textController.text.isEmpty) return;
                context
                    .read<ChatBloc>()
                    .add(NewMessageEvent(message: textController.text));

                textController.clear();
              },
            ),
          ],
        ),
      ),
    );
  }
}
