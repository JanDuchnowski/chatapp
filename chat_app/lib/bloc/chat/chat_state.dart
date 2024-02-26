part of 'chat_bloc.dart';

enum ChatStateStatus {
  initial,
  fetching,
  fetched,
  newMessageAdded,
  messageDeleted
}

@immutable
class ChatState extends Equatable {
  final List<String> messageHistory;
  final List<String> answerHistory;
  final ChatStateStatus status;
  final List<Product> productList;

  const ChatState(
      {required this.messageHistory,
      required this.answerHistory,
      required this.status,
      required this.productList});

  ChatState.initial()
      : messageHistory = [],
        answerHistory = [],
        status = ChatStateStatus.initial,
        productList = [];

  ChatState copyWith(
      {List<String>? messageHistory,
      List<String>? answerHistory,
      ChatStateStatus? status,
      List<Product>? productList}) {
    return ChatState(
      messageHistory: messageHistory ?? this.messageHistory,
      answerHistory: answerHistory ?? this.answerHistory,
      status: status ?? this.status,
      productList: productList ?? this.productList,
    );
  }

  @override
  List<Object> get props =>
      [messageHistory, answerHistory, status, productList];
}
