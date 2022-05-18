import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';

import 'package:geolocator/geolocator.dart';

import 'package:gharelu_app/MainPage.dart';
import 'package:gharelu_app/ModelClass/locationModel.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YourLoc extends StatefulWidget {
  @override
  _YourLocState createState() => _YourLocState();
}

class _YourLocState extends State<YourLoc> {
  Position position;
  var latitude;
  var longitude;
  var addresses;
  var first;

  double distanceInMeters;
  Completer<GoogleMapController> controller = Completer();
  GoogleMapController _controller;

  Future getcurrentlocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      latitude = position.latitude;
      longitude = position.longitude;
      getaddress(latitude, longitude);
    });
  }

  getaddress(double lat, double long) async {
    final coordinates = new Coordinates(lat, long);
    var address =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    setState(() async {
      var add = address.first.subLocality;
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('Address', add);
    });
  }

  @override
  void initState() {
    super.initState();
    getcurrentlocation();
  }

  @override
  Widget build(BuildContext context) {
    final loc = Provider.of<Getlocation>(context);
    return Scaffold(
        body: latitude != null
            ? Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: Stack(
                  children: [
                    GoogleMap(
                      myLocationEnabled: true,
                      mapType: MapType.normal,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(latitude, longitude),
                        zoom: 13.0,
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
                            onPressed: () async {
                              loc.addloc(latitude, longitude);

                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => MainPage()));
                            },
                            elevation: 5,
                            color: Colors.blue[600],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text("Next",
                                  style: GoogleFonts.quicksand(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  )),
                            )),
                      ),
                    )
                  ],
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
