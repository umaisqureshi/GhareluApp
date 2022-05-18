import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Color(0xff0674bd),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Image.asset('assets/images/full white-01.png', scale: 15,),
            ),
          )


      ),
    );
  }
}