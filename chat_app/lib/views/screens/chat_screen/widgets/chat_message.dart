import 'package:chat_app/bloc/chat/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatMessage extends StatefulWidget {
  String text;
  final int index;
  ChatMessage({Key? key, required this.text, required this.index})
      : super(key: key);

  @override
  _ChatMessageState createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  final TextEditingController _textController = TextEditingController();
  bool isEditing = false;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void startEditing() {
    setState(() {
      isEditing = true;
      _textController.text = widget.text;
    });
  }

  void cancelEditing() {
    setState(() {
      isEditing = false;
      _textController.text = '';
    });
  }

  void saveChanges() {
    setState(() {
      isEditing = false;
      widget.text = _textController.text;
      if (_textController.text.isEmpty) {
        context.read<ChatBloc>().add(DeleteMessageEvent(index: widget.index));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: Theme.of(context).canvasColor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(width: 8.0),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (isEditing)
                  TextField(
                    controller: _textController,
                  )
                else
                  Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: Text(widget.text),
                  ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              if (isEditing) {
                saveChanges();
              } else {
                startEditing();
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              context
                  .read<ChatBloc>()
                  .add(DeleteMessageEvent(index: widget.index));
            },
          ),
          if (isEditing)
            IconButton(
              icon: const Icon(Icons.cancel),
              onPressed: cancelEditing,
            ),
        ],
      ),
    );
  }
}
