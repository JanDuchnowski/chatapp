import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_app/bloc/chat/chat_bloc.dart';
import 'package:chat_app/constant_strings.dart';
import 'package:chat_app/views/screens/chat_screen/widgets/chat_message.dart';
import 'package:chat_app/views/screens/chat_screen/widgets/product_card.dart';
import 'package:chat_app/utils/build_context_data.dart';
import 'package:chat_app/views/screens/chat_screen/widgets/text_prompt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ChatScreen extends StatefulWidget {
  ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController textController = TextEditingController();
  double _minRangeValue = 40;
  double _maxRangeValue = 80;

  @override
  Widget build(BuildContext context) {
    final BuildContextData ctxData = BuildContextData(context);
    return BlocConsumer<ChatBloc, ChatState>(
      listener: (context, state) {
        if (state.status == ChatStateStatus.fetched) {
          // _scrollController.animateTo(
          //   _scrollController.position.keepScrollOffset ? 0 : 0,
          //   duration: const Duration(milliseconds: 500),
          //   curve: Curves.easeOut,
          // );
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              foregroundColor: Colors.transparent,
              toolbarOpacity: 0.0,
              bottomOpacity: 0.0,
              toolbarHeight: kIsWeb ? 120 : 90,
              flexibleSpace: Container(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Colors.white,
                  child: RangeSlider(
                    activeColor: Colors.black,
                    divisions: 10,
                    values: RangeValues(_minRangeValue, _maxRangeValue),
                    onChanged: (value) {
                      setState(() {
                        _minRangeValue = value.start;
                        _maxRangeValue = value.end;
                      });
                    },
                    min: 0,
                    max: 100,
                    labels: RangeLabels(
                      _minRangeValue.toString(),
                      _maxRangeValue.toString(),
                    ),
                  ),
                ),
              ),
            ),
            bottomNavigationBar: state.messageHistory.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8, bottom: kIsWeb ? 110 : 70),
                    child: TextPrompt(textController: textController),
                  )
                : null,
            body: SafeArea(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: state.messageHistory.isEmpty
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.start,
                      children: [
                        //if (state.messageHistory.isNotEmpty)

                        if (state.messageHistory.isNotEmpty)
                          Expanded(
                            child: SingleChildScrollView(
                              //   controller: _scrollController,
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  // SizedBox(
                                  //   height: ctxData.screenHeight * 0.05,
                                  // ),
                                  if (state.messageHistory.isNotEmpty)
                                    ListView.separated(
                                      //    controller: _scrollController,
                                      padding: const EdgeInsets.only(bottom: 8),
                                      separatorBuilder: (context, _) =>
                                          const SizedBox(
                                        height: 0,
                                      ),
                                      physics:
                                          const NeverScrollableScrollPhysics(),
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
                                                color: Theme.of(context)
                                                    .cardTheme
                                                    .color,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: AnimatedTextKit(
                                              pause: const Duration(
                                                  milliseconds: 500),
                                              isRepeatingAnimation: false,
                                              animatedTexts: [
                                                TyperAnimatedText(state.answer,
                                                    textStyle: const TextStyle(
                                                        fontSize: 16))
                                              ],
                                            ),
                                          ),
                                        if (state.messageHistory.isEmpty)
                                          const Text(
                                              ConstantStrings.WELCOME_USER),
                                        SizedBox(
                                          height: ctxData.screenHeight * 0.02,
                                        ),
                                        if (state.messageHistory.isNotEmpty)
                                          LayoutBuilder(
                                              builder: (context, constraints) {
                                            if (MediaQuery.of(context)
                                                    .size
                                                    .width <
                                                600) {
                                              return Expanded(
                                                child: ListView.builder(
                                                  shrinkWrap: true,
                                                  padding: EdgeInsets.zero,
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  itemBuilder:
                                                      (context, index) {
                                                    return ProductRecommendationCard(
                                                      product: state
                                                          .productList[index],
                                                    );
                                                  },
                                                  itemCount:
                                                      state.productList.length,
                                                  //
                                                  //   shrinkWrap: true,
                                                ),
                                              );
                                            } else {
                                              return Expanded(
                                                child: GridView.builder(
                                                  padding: EdgeInsets.zero,
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 3,
                                                    childAspectRatio: 3,
                                                    crossAxisSpacing: 10,
                                                    mainAxisSpacing: 1,
                                                    mainAxisExtent: 200,
                                                  ),
                                                  itemBuilder:
                                                      (context, index) {
                                                    return ProductRecommendationCard(
                                                      product: state
                                                          .productList[index],
                                                    );
                                                  },
                                                  itemCount:
                                                      state.productList.length,
                                                  shrinkWrap: true,
                                                ),
                                              );
                                            }
                                          }),
                                      ],
                                    ),
                                  if (state.status == ChatStateStatus.fetching)
                                    const Center(
                                        child: CircularProgressIndicator())
                                ],
                              ),
                            ),
                          ),
                        if (state.messageHistory.isEmpty)
                          Padding(
                            padding: EdgeInsets.only(bottom: 100),
                            child: Column(
                              children: [
                                const Text(
                                  ConstantStrings.appTitle,
                                  style: TextStyle(
                                    fontFamily: 'Jockey One',
                                    fontSize: 64,
                                    fontWeight: FontWeight.w400,
                                    height: 89 / 64,
                                    letterSpacing: 0,
                                  ),
                                ),
                                TextPrompt(
                                  textController: textController,
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  // Positioned(
                  //   top: 0,
                  //   child: SizedBox(
                  //     width: ctxData.screenWidth,

                  //   ),
                  // )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
