import 'package:flutter/material.dart';
import 'package:space_app/planet.dart';
import 'package:space_app/planets_data.dart';
import 'planet_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  void nextPlanet() {
    setState(() {
      if (currentIndex < planets.length - 1) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }
    });
  }

  void previousPlanet() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      } else {
        currentIndex = planets.length - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Planet planet = planets[currentIndex];

    return Scaffold(
      backgroundColor: const Color(0xff0D0D0D),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            //const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                "assets/images/Rectangle 4.png",
                width: double.infinity,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),

            //const SizedBox(height: 20),
            const Center(
              child: Text(
                "Explore",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Which planet\nwould you like to explore?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            Center(child: Image.asset(planet.image, height: 240)),

            const SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                CircleAvatar(
                  backgroundColor: Colors.red,

                  child: IconButton(
                    onPressed: previousPlanet,
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),

                Text(
                  planet.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                CircleAvatar(
                  backgroundColor: Colors.red,

                  child: IconButton(
                    onPressed: nextPlanet,
                    icon: const Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                ),
              ],
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 60,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlanetDetailsScreen(planet: planet),
                    ),
                  );
                },

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    const SizedBox(),

                    Text(
                      "Explore ${planet.name}",
                      style: const TextStyle(fontSize: 22, color: Colors.white),
                    ),

                    const Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
