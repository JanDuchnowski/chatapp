import 'package:chat_app/utils/build_context_data.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({
    super.key,
    required this.currentlySelected,
    required this.onTap,
  });

  final int currentlySelected;
  final Function(int) onTap;

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final BuildContextData ctxData = BuildContextData(context);

    return GestureDetector(
      onTap: () {
        // Navigator.of(context).pop();
      },
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 200,
              spreadRadius: 20,
            )
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          onTap: (int index) {
            widget.onTap(index);
          },
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          unselectedItemColor: const Color.fromRGBO(144, 144, 145, 1),
          currentIndex: widget.currentlySelected,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history, color: Colors.black),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.black),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: Colors.black),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                color: Colors.black,
              ),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
