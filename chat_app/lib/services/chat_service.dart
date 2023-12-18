class ChatService{ 

  Map<String, dynamic>  fetchChatResponse(String text) {
    Future.delayed(const Duration(milliseconds: 200), () => null);
    //response should have a message describing some of the products also making some suggestions
    // 4 product photo links plus some information about the product
    Map<String, dynamic> response = {
      'text': 'This is an AI response to "$text"',
      'isSentByUser': false,
    };
    return response;
  }
}