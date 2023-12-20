import 'package:chat_app/utils/build_context_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({
    Key? key,
    required this.currentlySelected,
    required this.onTap,
  }) : super(key: key);

  final int currentlySelected;
  final Function(int) onTap;

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final BuildContextData ctxData = BuildContextData(context);

    return Container(
      decoration:  BoxDecoration(
        color: Theme.of(context).cardColor,
      ),
      child: BottomNavigationBar(
        backgroundColor: Theme.of(context).cardColor,
        onTap: (int index) {
          widget.onTap(index);
        },
        type: BottomNavigationBarType.fixed,
        elevation: 0,
    
        unselectedItemColor: const Color.fromRGBO(144, 144, 145, 1),
        currentIndex: widget.currentlySelected,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
