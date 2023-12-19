import 'package:bloc/bloc.dart';
import 'package:chat_app/interfaces/chat_interface.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatInterface chatInterface;
  ChatBloc({required this.chatInterface}) : super(ChatState.initial()) {
  on<NewMessageEvent>((event, emit) async{
    final Map<String, dynamic> response = await chatInterface.handleNewMessage(event.message);
    final List<String> messageHistory = state.messageHistory + [event.message];
    emit(state.copyWith(messageHistory: messageHistory, answer:'answer', status: ChatStateStatus.fetched));
  },);

  on<DeleteMessageEvent>((event, emit) {
    final List<String> messageHistory = state.messageHistory;
    final List<String> szyc = List.from(messageHistory)..removeAt(event.index);
    emit(state.copyWith(messageHistory: szyc, answer:'answer', status: ChatStateStatus.messageDeleted));
  },);
  }
}
