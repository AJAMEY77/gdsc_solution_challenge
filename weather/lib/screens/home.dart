import 'package:flutter/material.dart';
import 'package:weather/screens/cropDoc.dart';
import 'package:weather/screens/homepage.dart';
import 'package:weather/screens/person.dart';
import 'package:weather/screens/PestisidesSection.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:weather/screens/weather.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int _tabIndex = 0;

  List<Widget> _screens = [
    HomePage(),
    WhetherApp(),
    cropDoc(),
    PestisidesSection(),
    person(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('TechFarma'),
      // ),
      body: IndexedStack(
        index: _tabIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blueAccent,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        unselectedLabelStyle: const TextStyle(color: Colors.blueAccent),
        selectedLabelStyle: const TextStyle(color: Colors.white),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.cloud,
            ),
            label: "Weather",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.medication,
            ),
            label: "CropDoctor",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_basket,
            ),
            label: "AgriStore",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "Profile",
          )
        ],
        currentIndex: _tabIndex,
        onTap: (int index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }
}
