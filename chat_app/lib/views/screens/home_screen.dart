import 'package:chat_app/bloc/navigation/navigation_bloc.dart';
import 'package:chat_app/utils/build_context_data.dart';
import 'package:chat_app/views/screens/account/account_screen.dart';
import 'package:chat_app/views/screens/chat_screen/chat_screen.dart';
import 'package:chat_app/views/screens/dashboard/dashboard.dart';
import 'package:chat_app/views/screens/favorites/favorites_screen.dart';
import 'package:chat_app/views/screens/history/history_screen.dart';
import 'package:chat_app/views/widget/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
    0: GlobalKey<NavigatorState>(),
    1: GlobalKey<NavigatorState>(),
    2: GlobalKey<NavigatorState>(),
    3: GlobalKey<NavigatorState>(),
    4: GlobalKey<NavigatorState>(),
  };
  final List<Widget> _widgetOptions = <Widget>[
    const DashboardScreen(),
    const HistoryScreen(),
    const ChatScreen(),
    const FavoritesScreen(),
    const AccountScreen(),
  ];

  void onItemTapped(int index) {
    context.read<NavigationBloc>().add(NavigationEvent(index: index));
  }

  @override
  Widget build(BuildContext context) {
    final BuildContextData ctxData = BuildContextData(context);
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return Stack(
          children: [
            SizedBox(
              height: ctxData.screenHeight, // - 100,
              child: buildNavigator(state.selectedIndex),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 70,
                child: CustomNavigationBar(
                    currentlySelected: state.selectedIndex,
                    onTap: onItemTapped),
              ),
            )
          ],
        );
      },
    );
  }

  buildNavigator(int index) {
    return Navigator(
      key: navigatorKeys[index],
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (_) => _widgetOptions.elementAt(index));
      },
    );
  }
}
