part of 'chat_bloc.dart';

@immutable
sealed class ChatEvent extends Equatable {}

final class NewMessageEvent extends ChatEvent {
  final String message;

  NewMessageEvent(this.message);

  @override
  List<Object> get props => [message];
}
