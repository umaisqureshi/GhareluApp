import 'package:flutter/material.dart';
import 'package:gharelu_app/Screens/GareluScreen/widegts/ConstantColors.dart';
import 'package:gharelu_app/Screens/ONBOARDING/page2.dart';

import 'package:google_fonts/google_fonts.dart';

class page1 extends StatefulWidget {
  @override
  _page1State createState() => _page1State();
}

class _page1State extends State<page1> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: darkBlue,
        body: Container(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 280,
                  child: Image.asset(
                    "assets/images/1.png",
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("FOOD FRESH",
                    style:
                        GoogleFonts.quicksand(fontSize: 25, color: Colors.white)
                    // style: TextStyle(
                    //   color: Colors.white,
                    //   fontSize: 25,
                    //   fontWeight: FontWeight.bold,
                    // ),
                    ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text(
                      "The web browser client will download automatically when you start or join your first Zoom meeting, and is also available for manual download here.",
                      style: GoogleFonts.quicksand(
                          fontSize: 15, color: Colors.white)),
                ),
                SizedBox(height: size.height * 0.1),
                ClipRRect(
                  borderRadius: BorderRadius.circular(28),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => page2()));
                    },
                    child: Container(
                      height: 50,
                      width: 180,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: Center(
                          child: Text("NEXT",
                              style: GoogleFonts.quicksand(
                                  fontSize: 15, color: Colors.white))),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
