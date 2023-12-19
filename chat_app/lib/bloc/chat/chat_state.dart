part of 'chat_bloc.dart';

enum ChatStateStatus { initial, fetching, fetched, newMessageAdded ,messageDeleted}

@immutable
 class ChatState extends Equatable {
    final List<String> messageHistory;
  final String answer;
  final ChatStateStatus status;

  const ChatState({required this.messageHistory, required this.answer, required this.status});

  ChatState.initial()
      : messageHistory = [],
        answer = '', status = ChatStateStatus.initial;

  ChatState copyWith({
    List<String>? messageHistory,
    String? answer,
    ChatStateStatus? status,
  }) {
    return ChatState(
      messageHistory: messageHistory ?? this.messageHistory,
      answer: answer ?? this.answer,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [messageHistory, answer, status];
}



