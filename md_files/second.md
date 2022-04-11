# main 

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:googlemapsflutter/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Map',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}



# home_screen

import 'package:flutter/material.dart';
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
              )
            ],
          )),
    );
  }
}

# map_screen

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  //google map gontroller
  final Completer<GoogleMapController> _controller = Completer();

  //initial position
  static const CameraPosition initialPosition =
      CameraPosition(target: LatLng(37.421998333333335, -122.084), zoom: 14.0);

  //target location that we must get once when we click floating action button
  static const CameraPosition targetPosition = CameraPosition(
    target: LatLng(12.870385, 75.041637),
    zoom: 14.0,
    bearing: 192,
    tilt: 60,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maps!!'),
        centerTitle: true,
      ),
      body: GoogleMap(
        initialCameraPosition: initialPosition,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            goToThePlace();
          },
          label: const Text('Somewhere on earth'),
          icon: const Icon(Icons.route)),
    );
  }

  //target fn once when clicked
  Future<void> goToThePlace() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(targetPosition));
  }
}

//  12.870385 , 75.041637
