import 'package:flutter/material.dart';

class ResponseMessage extends StatelessWidget {
  final String message;

  const ResponseMessage({Key? key,required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        message,
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.black,
        ),
      ),
    );
  }
}