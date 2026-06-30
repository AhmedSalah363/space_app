import 'package:flutter/material.dart';
import 'package:space_app/home_screen.dart';
import 'package:space_app/splash_screen.dart';

void main() {
  runApp(const SpaceApp());
}

class SpaceApp extends StatelessWidget {
  const SpaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Space App',

      initialRoute: SplashScreen.routeName,

      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
      },

      // لأن PlanetDetailsScreen يستقبل Planet،
      // فلا يمكن إضافته داخل routes العادية.
      onGenerateRoute: (settings) {
        return null;
      },
    );
  }
}
