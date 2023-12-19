part of 'chat_bloc.dart';

@immutable
sealed class ChatEvent extends Equatable {}

final class NewMessageEvent extends ChatEvent {
  final String message;

  NewMessageEvent({required this.message});

  @override
  List<Object> get props => [message];
}

final class DeleteMessageEvent extends ChatEvent {
  final int index;

  DeleteMessageEvent({required this.index});

  @override
  List<Object> get props => [index];
}