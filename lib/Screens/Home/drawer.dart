
import 'package:flutter/material.dart';
import 'package:gharelu_app/Screens/Drawer/DrawerScreens/MyProfile.dart';
import 'package:gharelu_app/Screens/Drawer/DrawerScreens/aboutUs.dart';
import 'package:gharelu_app/Screens/Drawer/DrawerScreens/termsconditions.dart';
import 'package:gharelu_app/Screens/ONBOARDING/page1.dart';
import 'package:gharelu_app/Screens/Order/OrderHistory.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Drawers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: Container(
                  width: media.width * 0.25,
                  height: media.height * 0.30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset("assets/images/logo.png"),
                ),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MyProfiles()));
              },
              child: ListTile(
                leading: Icon(
                  Icons.home_rounded,
                  color: Colors.blueAccent,
                ),
                title: Text(
                  "My Profile",
                  style: GoogleFonts.quicksand(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
            Divider(),
            InkWell(
              child: ListTile(
                leading: Icon(
                  Icons.menu_open_sharp,
                  color: Colors.blueAccent,
                ),
                title: Text(
                  "Check Orders",
                  style: GoogleFonts.quicksand(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => OrderHistory()));
              },
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TermsAndConditions()));
              },
              leading: Icon(
                Icons.contact_page_rounded,
                color: Colors.blueAccent,
              ),
              title: Text(
                "Terms and Conditions",
                style: GoogleFonts.quicksand(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => AboutUs()));
              },
              leading: Icon(
                Icons.assignment,
                color: Colors.blueAccent,
              ),
              title: Text(
                "About Us",
                style: GoogleFonts.quicksand(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ),
            Divider(),
            ListTile(
              onTap: () async {
                final SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.remove('Number');
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => page1()));
              },
              leading: Icon(
                Icons.logout,
                color: Colors.blueAccent,
              ),
              title: Text(
                "Log Out",
                style: GoogleFonts.quicksand(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
