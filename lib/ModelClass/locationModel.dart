import 'package:flutter/cupertino.dart';

class Location {
  double latitude, longitude;

  Location({this.latitude, this.longitude});
}

class Getlocation with ChangeNotifier {
  Map<String, Location> _loc = {};
  Map<String, Location> get loc {
    return {..._loc};
  }

  void addloc(double lati, double long) {
    _loc.putIfAbsent(
      lati.toString(),
      () => Location(latitude: lati, longitude: long),
    );
  }

  notifyListeners();
}
