import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/screens/our_themes.dart';
import 'package:weather/screens/homepage.dart';
import 'dart:async';

import 'package:weather/screens/weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: CustomThemes.lightTheme, //theme changing
      darkTheme: CustomThemes.darkTheme, //theme changing
      themeMode: ThemeMode.system, //theme changed on the base of system
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (BuildContext context) => const load(),
        '/HomePage': (BuildContext context) => const HomePage(),
        '/WhetherApp': (BuildContext context) => const WhetherApp(),
      },
      title: "TechFarma",
    );
  }
}

class load extends StatefulWidget {
  const load({super.key});

  @override
  State<load> createState() {
    return _loadState();
  }
}

// ignore: camel_case_types
class _loadState extends State<load> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 8),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 150.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              width: 300,
              height: 300,
              child: Lottie.network(
                  'https://lottie.host/495e8829-e500-4c2f-be41-f822fd1cfd69/UIeFgUUVuc.json'),
            ),
            Text(
              ' Grow Green. Grow Smart.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,

                //letterSpacing: 8.0,
                wordSpacing: 7.0,
                color: Colors.blue,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
