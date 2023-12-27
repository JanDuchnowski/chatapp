import 'package:chat_app/bloc/authentication/authentication_bloc.dart';
import 'package:chat_app/bloc/bloc_observer.dart';
import 'package:chat_app/bloc/chat/chat_bloc.dart';
import 'package:chat_app/bloc/theme/theme_bloc.dart';
import 'package:chat_app/interfaces/chat_interface.dart';
import 'package:chat_app/repositories/chat_repository.dart';
import 'package:chat_app/views/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/navigation/navigation_bloc.dart';

void main() {
  final ChatInterface chatInterface = ChatRepository();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => NavigationBloc()),
      BlocProvider(
        create: (context) => ChatBloc(chatInterface: chatInterface),
      ),
      BlocProvider(
        create: (context) => AuthenticationBloc(),
      ),
      BlocProvider(create: (context) => ThemeBloc()),
    ],
    child: const ChatGPTPage(),
    
  ),
  );
    Bloc.observer = AppBlocObserver();
}

class ChatGPTPage extends StatelessWidget {
  const ChatGPTPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(      
        body: HomeScreen(),

      ),
    );
  }
}





// ListView z poprzednimi wiadomościami na górze
// SizedBox
// Szybki opis + 5 wyników