import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_travel/home_trips.dart';
import 'package:flutter_app_travel/profile_trips.dart';
import 'package:flutter_app_travel/search_trips.dart';


class PlatziTripsCupertino extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            currentIndex: 1,
            backgroundColor: Color(0x33FFFFFF),
            items: [
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.home, color: Colors.red),
                  icon: Icon(Icons.home, color: Colors.indigo),
                  title: Text("")
              ),
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.search, color: Colors.red),
                  icon: Icon(Icons.search, color: Colors.indigo),
                  title: Text("")
              ),
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.person, color: Colors.red),
                  icon: Icon(Icons.person, color: Colors.indigo),
                  title: Text("")
              ),
            ]
        ),

        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (BuildContext context) => HomeTrips(),
              );
              break;
            case 1:
              return CupertinoTabView(
                builder: (BuildContext context) => SearchTrips(),
              );
              break;
            case 2:
              return CupertinoTabView(
                builder: (BuildContext context) => ProfileTrips(),
              );
              break;
          }
        },
      ),
    );
  }
}