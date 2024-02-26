import 'package:bloc/bloc.dart';
import 'package:chat_app/interfaces/chat_interface.dart';
import 'package:chat_app/models/product.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatInterface chatInterface;
  ChatBloc({required this.chatInterface}) : super(ChatState.initial()) {
    on<NewMessageEvent>(
      (event, emit) async {
        final List<String> messageHistory =
            state.messageHistory + [event.message];
        emit(state.copyWith(
            messageHistory: messageHistory, status: ChatStateStatus.fetching));
        final Map<String, dynamic> response =
            await chatInterface.handleNewMessage(event.message);

        final List<Product> productList = [];
        for (var element
            in (response['products'] as Map<String, dynamic>).values) {
          print(element);
          productList.add(Product.fromJson(element));
        }
        final String answer = response['recommendation'];
        final List<String> answerHistory = state.answerHistory + [answer];
        emit(state.copyWith(
          messageHistory: messageHistory,
          answerHistory: answerHistory,
          status: ChatStateStatus.fetched,
          productList: productList,
        ));
      },
    );

    on<DeleteMessageEvent>(
      (event, emit) async {
        final List<String> messageHistory = state.messageHistory;
        final List<String> szyc = List.from(messageHistory)
          ..removeAt(event.index);

        emit(state.copyWith(
          messageHistory: szyc,
          status: ChatStateStatus.fetching,
        ));

//Take all the messages and send them to ai interface

        final Map<String, dynamic> response =
            await chatInterface.handleNewMessage(szyc.join(' '));

        final List<Product> productList = [];
        for (var element
            in (response['products'] as Map<String, dynamic>).values) {
          print(element);
          productList.add(Product.fromJson(element));
        }
        final String answer = response['recommendation'];

        state.answerHistory.removeAt(state.answerHistory.length - 1);

        emit(state.copyWith(
            messageHistory: szyc,
            answerHistory: state.answerHistory,
            status: ChatStateStatus.fetched,
            productList: productList));
      },
    );
  }
}
