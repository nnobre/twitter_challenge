import 'package:flutter/material.dart';
import 'package:twitter_app/features/feed/pages/feed_screen.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => new _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int _currentTabbarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: _currentTabbarIndex == 0
              ? Text("Feed", style: TextStyle(color: Colors.black))
              : Text("N/A", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          elevation: 1,
          leading: Container(
            margin: const EdgeInsets.all(10.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/nno_photo.png')
            )
          ),
        ),
        body: _currentTabbarIndex == 0 ? FeedScreen() : Container(),
        bottomNavigationBar: SizedBox(
          height: 100,
          child: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  label: "",
                  icon: Icon(
                    Icons.home,
                    color: _currentTabbarIndex == 0
                        ? Colors.blue
                        : Colors.blueGrey,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "",
                  icon: Icon(
                    Icons.search,
                    color: _currentTabbarIndex == 1
                        ? Colors.blue
                        : Colors.blueGrey,
                  ),
                ),
                BottomNavigationBarItem(
                    label: "",
                    icon: Icon(
                      Icons.notifications,
                      color: _currentTabbarIndex == 2
                          ? Colors.blue
                          : Colors.blueGrey,
                    )),
                BottomNavigationBarItem(
                  label: "",
                  icon: Icon(
                    Icons.mail,
                    color: _currentTabbarIndex == 3
                        ? Colors.blue
                        : Colors.blueGrey,
                  ),
                ),
              ],
              onTap: (index) {
                setState(() {
                  _currentTabbarIndex = index;
                });
              },
              currentIndex: _currentTabbarIndex),
        ));
  }
}
