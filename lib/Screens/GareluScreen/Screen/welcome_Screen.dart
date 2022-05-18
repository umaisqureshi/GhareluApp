import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gharelu_app/Screens/Location/CurrentLocation.dart';
import 'package:gharelu_app/Screens/ONBOARDING/page1.dart';

import 'package:shared_preferences/shared_preferences.dart';


String finalnumber;

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    getvalidation().whenComplete(() async {
      Timer(
          Duration(seconds: 4),
          () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      finalnumber == null ? page1() : CurrentLocation())));
    });
  }

  Future getvalidation() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var getNumber = sharedPreferences.getString('Number');

    setState(() {
      finalnumber = getNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              scale: 18,
            ),
          ),
          SizedBox(height: 80),
          CircularProgressIndicator(
            backgroundColor: Colors.yellow,
          )
        ],
      ),
    );
  }
}
