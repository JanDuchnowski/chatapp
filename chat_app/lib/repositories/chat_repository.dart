import 'package:chat_app/interfaces/chat_interface.dart';
import 'package:chat_app/services/chat_service.dart';

class ChatRepository implements ChatInterface {
  final ChatService _chatService = ChatService();
  @override
  Future<Map<String, dynamic>> handleNewMessage(String message) async {
    return  _chatService.fetchChatResponse(message);
  }
  
}