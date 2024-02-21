import 'package:flutter/material.dart';
import 'package:weather/screens/person.dart';
import 'package:weather/screens/PestisidesSection.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:weather/screens/weather.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _tabIndex = 0;
  List catNames = [
    "HERBICIDES",
    "INSECTICIDES",
    "ALGAECIDES",
    "BACTERICIDES",
    "FUNGICIDES",
    "LARVICIDES",
  ];

  List<Icon> catIcons = [
    Icon(MdiIcons.tree, color: Colors.green, size: 33),
    Icon(MdiIcons.seedOutline, color: Colors.blue, size: 33),
    Icon(MdiIcons.waterThermometerOutline, color: Colors.yellow, size: 33),
    Icon(MdiIcons.spray, color: Colors.blue, size: 33),
    Icon(MdiIcons.bacteriaOutline, color: Colors.green, size: 33),
    Icon(MdiIcons.seedPlusOutline, color: Colors.yellow, size: 33),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage(
                                  "assets/images/Home_page/user_profile.jpg",
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.notifications,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Icon(
                                Icons.shopping_bag,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            "Hello, Farmers ",
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Welcome to TechFarma",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 21,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 160),
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              width: 340,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 6,
                                      spreadRadius: 2,
                                    )
                                  ]),
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: " Search Plant & Pesticides ",
                                    hintStyle: TextStyle(
                                        color: Colors.black.withOpacity(0.5)),
                                    prefixIcon: Icon(
                                      Icons.search,
                                      size: 20,
                                    ),
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 220),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7),
                        child: Text(
                          "  Categories ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                              color: Colors.black.withOpacity(0.7)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 270),
                    child: SizedBox(
                      height: 150,
                      child: GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        primary: false,
                        itemCount: catNames.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                        ),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 4),
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: catIcons[index],
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                catNames[index],
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black12.withOpacity(0.7),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.only(top: 400),
                    child: Text(
                      "  Recommonded Pesticides",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                          color: Colors.black.withOpacity(0.7)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 340),
                    child: SizedBox(child: PestisidesSection()),
                  ),
                ],
              ),
            ],
          ),
        ),
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
              label: "Weather"), // Changed the label to "Weather"
          BottomNavigationBarItem(
              icon: Icon(
                Icons.medication,
              ),
              label: "CropDoctor"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_basket,
              ),
              label: "AgriStore"),
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
          if (index == 4) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => person()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WhetherApp()),
            );
          }
        },
      ),
    );
  }
}
