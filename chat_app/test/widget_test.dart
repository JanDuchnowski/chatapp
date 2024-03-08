// // This is a basic Flutter widget test.
// //
// // To perform an interaction with a widget in your test, use the WidgetTester
// // utility in the flutter_test package. For example, you can send tap and scroll
// // gestures. You can also use WidgetTester to find child widgets in the widget
// // tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'package:chat_app/main.dart';

// void main() {
//   testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//     // Build our app and trigger a frame.

//     // await tester.pumpWidget(const ChatGPTPage());

//     // // Verify that our counter starts at 0.
//     // expect(find.text('0'), findsOneWidget);
//     // expect(find.text('1'), findsNothing);

//     // // Tap the '+' icon and trigger a frame.
//     // await tester.tap(find.byIcon(Icons.add));
//     // await tester.pump();

//     // // Verify that our counter has incremented.
//     // expect(find.text('0'), findsNothing);
//     // expect(find.text('1'), findsOneWidget);
//   });
// }

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_app/bloc/authentication/authentication_bloc.dart';
import 'package:chat_app/bloc/chat/chat_bloc.dart';
import 'package:chat_app/bloc/navigation/navigation_bloc.dart';
import 'package:chat_app/bloc/theme/theme_bloc.dart';
import 'package:chat_app/interfaces/chat_interface.dart';
import 'package:chat_app/views/screens/home_screen.dart';
import 'package:mockito/mockito.dart';

void main() {
  testWidgets('App initializes correctly', (WidgetTester tester) async {
    // Create a mock ChatInterface
    final chatInterface = MockChatInterface();

    // Create a mock ChatBloc
    final chatBloc = MockChatBloc();

    // Create a mock AuthenticationBloc
    final authenticationBloc = MockAuthenticationBloc();

    // Create a mock ThemeBloc
    final themeBloc = MockThemeBloc();

    // Create a mock NavigationBloc
    final navigationBloc = MockNavigationBloc();

    // Create a mock ThemeState
    final themeState = MockThemeState();

    // Create a mock MaterialApp
    final materialApp = MaterialApp(
      home: BlocProvider(
        create: (context) => NavigationBloc(),
        child: const Scaffold(
          body: HomeScreen(),
        ),
      ),
    );

    // Build the app with the mock providers
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider<NavigationBloc>.value(value: navigationBloc),
          BlocProvider<ChatBloc>.value(value: chatBloc),
          BlocProvider<AuthenticationBloc>.value(value: authenticationBloc),
          BlocProvider<ThemeBloc>.value(value: themeBloc),
        ],
        child: materialApp,
      ),
    );

    // Verify that the app initializes correctly
    expect(find.byWidget(materialApp), findsOneWidget);
    // expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(HomeScreen), findsOneWidget);

    // Verify that the necessary blocs are provided
    // expect(BlocProvider.of<NavigationBloc>(tester), equals(navigationBloc));
    // expect(BlocProvider.of<ChatBloc>(tester), equals(chatBloc));
    // expect(BlocProvider.of<AuthenticationBloc>(tester),
    //     equals(authenticationBloc));
    // expect(BlocProvider.of<ThemeBloc>(tester), equals(themeBloc));
  });
}

// Mock classes for testing

class MockChatInterface extends Mock implements ChatInterface {}

class MockChatBloc extends MockBloc<ChatEvent, ChatState> implements ChatBloc {}

class MockAuthenticationBloc
    extends MockBloc<AuthenticationEvent, AuthenticationState>
    implements AuthenticationBloc {}

class MockThemeBloc extends MockBloc<ThemeEvent, ThemeState>
    implements ThemeBloc {}

class MockNavigationBloc extends MockBloc<NavigationEvent, NavigationState>
    implements NavigationBloc {}

class MockThemeState extends Mock implements ThemeState {}
