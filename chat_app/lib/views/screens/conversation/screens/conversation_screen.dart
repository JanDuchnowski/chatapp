import 'package:chat_app/bloc/chat/chat_bloc.dart';
import 'package:chat_app/utils/build_context_data.dart';
import 'package:chat_app/views/screens/chat_screen/widgets/product_card.dart';
import 'package:chat_app/views/screens/chat_screen/widgets/text_prompt.dart';
import 'package:chat_app/views/screens/conversation/widgets/conversation_bubble.dart';
import 'package:chat_app/views/widget/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversationScreen extends StatefulWidget {
  const ConversationScreen({super.key});

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  final TextEditingController textController = TextEditingController();
  final RangeValues _currentRangeValues = const RangeValues(40, 80);
  List<String> messageHistory = [];
  List<String> answerHistory = [];
  @override
  Widget build(BuildContext context) {
    final BuildContextData ctxData = BuildContextData(context);
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        {
          if (state.messageHistory.isNotEmpty &&
              state.answerHistory.isNotEmpty) {
            messageHistory = state.messageHistory;
            answerHistory = state.answerHistory;
          }

          return Scaffold(
            appBar: const CustomBarWidget(
              title: "Gaming Laptop",
            ),
            body: SingleChildScrollView(
              child: (state.messageHistory.isNotEmpty)
                  ? Column(
                      children: [
                        for (int i = 0;
                            i < messageHistory.length ||
                                i < answerHistory.length;
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
                                  ),
                                ),
                              ],
                            ),
                          ),
                        (state.status == ChatStateStatus.fetched &&
                                state.productList.isNotEmpty)
                            ? LayoutBuilder(builder: (context, constraints) {
                                //if (MediaQuery.of(context).size.width < 600) {
                                return Expanded(
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return ProductRecommendationCard(
                                        product: state.productList[index],
                                      );
                                    },
                                    itemCount: state.productList.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 8,
                                      mainAxisSpacing: 8,
                                      childAspectRatio: 1.7,
                                    ),
                                  ),
                                );
                              })
                            : const Center(
                                child: CircularProgressIndicator(
                                  color: CupertinoColors.activeBlue,
                                ),
                              ),
                      ],
                    )
                  : Container(),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, right: 8, bottom: kIsWeb ? 80 : 70),
              child: TextPrompt(
                textController: textController,
              ),
            ),
          );
        }
      },
    );
  }
}
