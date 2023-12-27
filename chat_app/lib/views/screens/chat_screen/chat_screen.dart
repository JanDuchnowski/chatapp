import 'package:chat_app/bloc/chat/chat_bloc.dart';
import 'package:chat_app/constant_strings.dart';
import 'package:chat_app/views/screens/chat_screen/widgets/chat_message.dart';
import 'package:chat_app/views/screens/chat_screen/widgets/product_card.dart';
import 'package:chat_app/utils/build_context_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  ChatScreen({super.key});
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final BuildContextData ctxData = BuildContextData(context);
    return BlocConsumer<ChatBloc, ChatState>(
      listener: (context, state) {
        if (state.status == ChatStateStatus.fetched) {
          print("triggered");
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeOut,
          );
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: state.messageHistory.isNotEmpty
                      ? ctxData.screenHeight * 0.85
                      : null,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        if (state.messageHistory.isNotEmpty)
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return ChatMessage(
                                text: state.messageHistory[index],
                                index: index,
                              );
                            },
                            itemCount: state.messageHistory.length,
                            shrinkWrap: true,
                          ),
                        if (state.status == ChatStateStatus.fetched)
                          Column(
                            children: [
                              if (state.messageHistory.isNotEmpty)
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).cardColor,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    state.answer,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              if (state.messageHistory.isEmpty)
                                const Text(ConstantStrings.WELCOME_USER),
                              SizedBox(
                                height: ctxData.screenHeight * 0.02,
                              ),
                              if (state.messageHistory.isNotEmpty)
                                GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    childAspectRatio: 3,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 1,
                                    mainAxisExtent: 200,
                                  ),
                                  itemBuilder: (context, index) {
                                    return ProductRecommendationCard(
                                      product: state.productList[index],
                                    );
                                  },
                                  itemCount: state.productList.length,
                                  shrinkWrap: true,
                                ),
                            ],
                          ),
                        if (state.status == ChatStateStatus.fetching)
                          const Center(child: CircularProgressIndicator())
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: _buildTextComposer(context),
                  ),
                ),
                ctxData.vSpaceLarge,
                ctxData.vSpaceLarge,
              ],
            ),
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
                if (_textController.text.isEmpty) return;
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
