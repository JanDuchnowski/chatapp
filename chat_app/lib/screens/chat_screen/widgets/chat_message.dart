import 'package:flutter/material.dart';

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
