import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:weather/screens/our_themes.dart';
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
      home: const SplashScre(),
      title: " Whether App ",
    );
  }
}

class SplashScre extends StatelessWidget {
  const SplashScre({Key? key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        /* Enable scrolling  */
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/splash_screen1.gif', height: 250),
                /* Adjust the height as needed */
                const SizedBox(height: 16),
                /* Add some spacing */
                SingleChildScrollView(
                  child: const Text(
                    'Weather App',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 247, 221, 194),
      nextScreen: WhetherApp(),
      splashIconSize: 250,
      duration: 2500,
      splashTransition: SplashTransition.sizeTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
      animationDuration: const Duration(seconds: 1),
    );
  }
}
