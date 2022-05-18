import 'dart:async';

import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:gharelu_app/Screens/Location/sample.dart';


import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CurrentLocation extends StatefulWidget {
  @override
  _CurrentLocationState createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
  Position position;
  var latitude = 31.5204;
  var longitude = 74.3587;

  double distanceInMeters;

  Completer<GoogleMapController> controller = Completer();

  GoogleMapController _controller;

  Future getcurrentlocation(double latitude, double longitude) async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  /*Future getstreamposition() async {
    StreamSubscription<Position> positionStream =
        Geolocator.getPositionStream(desiredAccuracy: LocationAccuracy.high)
            .listen((position) {
      latitude = position.latitude;

      longitude = position.longitude;
    });
  }
*/
  Future getdistance() {
    distanceInMeters = Geolocator.distanceBetween(
        position.latitude, position.longitude, 52.3546274, 4.8285838);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: LatLng(latitude, longitude),
                zoom: 13.4746,
              ),
              onMapCreated: (GoogleMapController controllers) {
                controller.complete(controllers);
              },
              onTap: (coordinate) {
                _controller.animateCamera(CameraUpdate.newLatLng(
                    LatLng(coordinate.latitude, coordinate.longitude)));
              },
            ),
            Positioned(
              bottom: 20,
              left: MediaQuery.of(context).size.width * 0.2,
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.6,
                child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => YourLoc()));
                    },
                    elevation: 5,
                    color: Colors.blue[600],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text("Current Location",
                          style: GoogleFonts.quicksand(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2)),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
