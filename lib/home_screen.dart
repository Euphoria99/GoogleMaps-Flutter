import 'package:flutter/material.dart';
import 'package:googlemapsflutter/screens/current_location_screen.dart';
import 'package:googlemapsflutter/screens/map_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Google Maps'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return const MapScreen();
                  }),
                );
              },
              child: const Text('Our Map'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return const CurrentLocationScreen();
                  }),
                );
              },
              child: const Text('Current Location'),
            )
          ],
        ),
      ),
    );
  }
}
