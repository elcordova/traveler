import 'package:flutter/material.dart';
import 'package:flutter_app_travel/home_trips.dart';
import 'package:flutter_app_travel/profile_trips.dart';
import 'package:flutter_app_travel/search_trips.dart';
class PlatziTrips extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PlatziTrips();
  }

}

class _PlatziTrips extends State<PlatziTrips> {

  int indexTab = 0;
  final List<Widget> widgetsChildren = [
    HomeTrips(),
    SearchTrips(),
    ProfileTrips()
  ];

  void onTaped(int index) {
    setState(() {
      indexTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetsChildren[indexTab],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Colors.white,
            primaryColor: Colors.purple
        ),
        child: BottomNavigationBar(
          onTap: onTaped,
          currentIndex: indexTab,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text("")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.place),
                title: Text("")
            ),
//            BottomNavigationBarItem(
//                icon: Icon(Icons.notifications),
//                title: Text("")
//            ),
//            BottomNavigationBarItem(
//                icon: Icon(Icons.person),
//                title: Text("")
//            ),
          ],
        ),
      ),
    );
  }

}