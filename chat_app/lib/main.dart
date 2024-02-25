import 'package:chat_app/bloc/authentication/authentication_bloc.dart';
import 'package:chat_app/bloc/bloc_observer.dart';
import 'package:chat_app/bloc/chat/chat_bloc.dart';
import 'package:chat_app/bloc/theme/theme_bloc.dart';
// import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/interfaces/chat_interface.dart';
import 'package:chat_app/repositories/chat_repository.dart';
import 'package:chat_app/views/screens/home_screen.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/navigation/navigation_bloc.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  final ChatInterface chatInterface = ChatRepository();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NavigationBloc()),
        BlocProvider(
          create: (context) => ChatBloc(chatInterface: chatInterface),
        ),
        BlocProvider(
          create: (context) => AuthenticationBloc(),
        ),
        BlocProvider(
            create: (context) => ThemeBloc()..add(const CheckThemeEvent())),
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
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          theme: state.theme,
          home: const Scaffold(
            body: HomeScreen(),
          ),
        );
      },
    );
  }
}
