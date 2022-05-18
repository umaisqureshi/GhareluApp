import 'dart:async';

import 'package:flutter/material.dart';

import 'package:gharelu_app/MainPage.dart';

import 'package:google_fonts/google_fonts.dart';

class SucessfulScreen extends StatefulWidget {
  @override
  _SucessfulScreenState createState() => _SucessfulScreenState();
}

class _SucessfulScreenState extends State<SucessfulScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MainPage())));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Image.asset(
                  'assets/images/logo.png',
                  scale: 15,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Successfully Submitted",
                  style:
                      GoogleFonts.quicksand(color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Order Will Be Arrive Soon",
                  style:
                      GoogleFonts.quicksand(color: Colors.white, fontSize: 12),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
