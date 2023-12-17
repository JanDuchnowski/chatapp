class ChatService{ 

  Map<String, dynamic>  fetchChatResponse(String text) {
    Future.delayed(const Duration(milliseconds: 200), () => null);
    Map<String, dynamic> response = {
      'text': 'This is an AI response to "$text"',
      'isSentByUser': false,
    };
    return response;
  }
}