part of 'chat_bloc.dart';

@immutable
sealed class ChatState extends Equatable {}

final class ChatInitial extends ChatState {
  @override
  List<Object> get props => [];
}

final class ChatFetchedState extends ChatState {
  final List<ChatMessage> messages;

  ChatFetchedState(this.messages);

  @override
  List<Object> get props => [messages];
}

