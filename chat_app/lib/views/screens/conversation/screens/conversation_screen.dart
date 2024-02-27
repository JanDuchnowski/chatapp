import 'package:chat_app/bloc/chat/chat_bloc.dart';
import 'package:chat_app/utils/build_context_data.dart';
import 'package:chat_app/views/screens/chat_screen/widgets/text_prompt.dart';
import 'package:chat_app/views/screens/conversation/widgets/conversation_bubble.dart';
import 'package:chat_app/views/widget/custom_app_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversationScreen extends StatefulWidget {
  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  final TextEditingController textController = TextEditingController();
  RangeValues _currentRangeValues = const RangeValues(40, 80);

  @override
  Widget build(BuildContext context) {
    final BuildContextData ctxData = BuildContextData(context);
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        List<String> messageHistory = state.messageHistory;
        List<String> answerHistory = state.answerHistory;

        return Scaffold(
          appBar: CustomBarWidget(
            title: "Szyc",
          ),
          //     AppBar(
          //   toolbarHeight: kIsWeb ? 90 : 90,
          //   title: Padding(
          //     padding: const EdgeInsets.only(bottom: 32.0),
          //     child: Text(
          //       "Choose price range",
          //       style: ctxData.textTheme.bodyLarge,
          //     ),
          //   ),
          //   flexibleSpace: RangeSlider(
          //     activeColor: Colors.black,
          //     divisions: 10,
          //     values: _currentRangeValues,
          //     onChanged: (value) {
          //       setState(() {
          //         _currentRangeValues = value;
          //       });
          //     },
          //     min: 0,
          //     max: 100,
          //     labels: RangeLabels(
          //       _currentRangeValues.start.round().toString(),
          //       _currentRangeValues.end.round().toString(),
          //     ),
          //   ),
          // ),
          body: SingleChildScrollView(
            child: Column(
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
                            title: answerHistory.length > i
                                ? answerHistory[i]
                                : '',
                            isDarkMode: true,
                            isLastAnswer: answerHistory.last ==
                                (answerHistory.length > i
                                    ? answerHistory[i]
                                    : ''),
                            //  isAnimated: true,
                          ),
                        ),
                      ],
                    ),
                  )
              ],
            ),
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
