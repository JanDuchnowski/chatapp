import 'package:flutter/material.dart';

class CustomBarWidget extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SizedBox(
        height: 160.0,
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.red,
              width: MediaQuery.of(context).size.width,
              height: 100.0,
              child: const Center(
                child: Text(
                  "Home",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
            ),
            Positioned(
              top: 80.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1.0),
                      border: Border.all(
                          color: Colors.grey.withOpacity(0.5), width: 1.0),
                      color: Colors.white),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          print("your menu action here");
                          _scaffoldKey.currentState?.openDrawer();
                        },
                      ),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search",
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          print("your menu action here");
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.notifications,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          print("your menu action here");
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
