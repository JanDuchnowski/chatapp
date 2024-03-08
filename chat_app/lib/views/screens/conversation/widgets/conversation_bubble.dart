import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_app/bloc/chat/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversationBubble extends StatelessWidget {
  const ConversationBubble({
    super.key,
    required this.title,
    this.isAnimated = false,
    this.isDarkMode = false,
    this.fullScreenWidth,
    this.onFinished,
    this.isLastAnswer = false,
  });

  final String title;
  final bool isAnimated;
  final bool isDarkMode;
  final bool? fullScreenWidth;
  final Function? onFinished;
  final bool isLastAnswer;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        return Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.5,
          ),
          width: fullScreenWidth != null
              ? MediaQuery.of(context).size.width
              : null,
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isDarkMode ? const Color.fromRGBO(80, 80, 80, 1) : Colors.white,
            border: Border.all(color: const Color.fromRGBO(80, 80, 80, 1)),
          ),
          child: isAnimated
              ? AnimatedTextKit(
                  pause: const Duration(milliseconds: 100),
                  isRepeatingAnimation: false,
                  onFinished: onFinished != null
                      ? () {
                          onFinished!();
                        }
                      : null,
                  animatedTexts: [
                    TyperAnimatedText(title,
                        textStyle: TextStyle(
                          fontSize: 16,
                          color: isDarkMode
                              ? Colors.white
                              : const Color.fromRGBO(80, 80, 80, 1),
                        ))
                  ],
                )
              : Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: isDarkMode
                            ? Colors.white
                            : const Color.fromRGBO(80, 80, 80, 1),
                      ),
                ),
        );
      },
    );
  }
}
