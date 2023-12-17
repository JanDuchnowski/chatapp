import 'package:chat_app/bloc/authentication/authentication_bloc.dart';
import 'package:chat_app/bloc/chat/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => ChatBloc(),
      ),
      BlocProvider(
        create: (context) => AuthenticationBloc(),
      ),
    ],
    child: ChatGPTPage(),
  ));
}

class ChatGPTPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ChatGPT'),
          centerTitle: true,
        ),
        body: ChatScreen(),
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      isSentByUser: true,
    );
    setState(() {
      _messages.insert(0, message);
      // Simulate AI response after a delay
      _handleAIResponse(text);
    });
  }

  void _handleAIResponse(String text) {
    // Simulate AI response after 1 second delay
    Future.delayed(Duration(seconds: 1), () {
      ChatMessage message = ChatMessage(
        text: 'This is an AI response to "$text"',
        isSentByUser: false,
      );
      setState(() {
        _messages.insert(0, message);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          child: ListView.builder(
            reverse: true,
            itemCount: _messages.length,
            itemBuilder: (_, int index) => _messages[index],
          ),
        ),
        Divider(height: 1.0),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: _buildTextComposer(),
        ),
      ],
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).canvasColor),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: InputDecoration.collapsed(
                  hintText: 'Type a message',
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () => _handleSubmitted(_textController.text),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isSentByUser;

  ChatMessage({required this.text, required this.isSentByUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          isSentByUser
              ? Expanded(child: SizedBox())
              : CircleAvatar(child: Text('AI')),
          SizedBox(width: 8.0),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: isSentByUser
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  isSentByUser ? 'You' : 'AI',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: Text(text),
                ),
              ],
            ),
          ),
          isSentByUser
              ? CircleAvatar(child: Text('You'))
              : Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
