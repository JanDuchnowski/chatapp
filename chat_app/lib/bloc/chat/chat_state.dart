part of 'chat_bloc.dart';

enum ChatStateStatus { initial, fetching, fetched, newMessageAdded ,messageDeleted}

@immutable
 class ChatState extends Equatable {
    final List<String> messageHistory;
  final String answer;
  final ChatStateStatus status;
  final List<Product> productList;

  const ChatState({required this.messageHistory, required this.answer, required this.status, required this.productList});

  ChatState.initial()
      : messageHistory = [],
        answer = '', status = ChatStateStatus.initial,  productList = [];

  ChatState copyWith({
    List<String>? messageHistory,
    String? answer,
    ChatStateStatus? status, List<Product>? productList
  }) {
    return ChatState(
      messageHistory: messageHistory ?? this.messageHistory,
      answer: answer ?? this.answer,
      status: status ?? this.status, productList: productList ?? this.productList
    );
  }

  @override
  List<Object> get props => [messageHistory, answer, status, productList];
}



