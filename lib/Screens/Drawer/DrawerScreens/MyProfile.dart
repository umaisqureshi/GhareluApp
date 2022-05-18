import 'package:flutter/material.dart';

import 'package:gharelu_app/MainPage.dart';
import 'package:gharelu_app/ModelClass/UserModel.dart';
import 'package:gharelu_app/Screens/GareluScreen/widegts/ConstantColors.dart';


import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

String namee, addresss, number;

class MyProfiles extends StatefulWidget {
  @override
  _MyProfilesState createState() => _MyProfilesState();
}

class _MyProfilesState extends State<MyProfiles> {
  final _formKey = GlobalKey<FormState>();

  Future getUser() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var name = sharedPreferences.getString('Name');
    var address = sharedPreferences.getString('address');
    var phone = sharedPreferences.getString('phone');
    setState(() {
      namee = name;
      addresss = address;
      number = phone;
    });
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final ur = Provider.of<UserProvider>(context);
//var data= FirebaseFirestore.instance.collection("User_Detail").doc(user.uid);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      child: Image.asset("assets/images/logo.png"),
                      radius: 80,
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Text("Name",style: GoogleFonts.quicksand(color: Colors.white,fontSize: 20),),
                    Icon(
                      Icons.person,
                      color: Colors.yellow,
                    ),
                    SizedBox(width: 30),
                    Text(
                      namee,
                      style: GoogleFonts.quicksand(color: Colors.white),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Text("Name",style: GoogleFonts.quicksand(color: Colors.white,fontSize: 20),),
                    Icon(
                      Icons.phone,
                      color: Colors.yellow,
                    ),
                    SizedBox(width: 30),
                    Text(
                      number,
                      style: GoogleFonts.quicksand(color: Colors.white),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Text("Name",style: GoogleFonts.quicksand(color: Colors.white,fontSize: 20),),
                    Icon(
                      Icons.home,
                      color: Colors.yellow,
                    ),
                    SizedBox(width: 30),
                    Container(
                      child: Text(
                        addresss,
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: GoogleFonts.quicksand(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 70),
              SizedBox(
                height: size.height * 0.08,
                width: size.width * 0.6,
                child: RaisedButton(
//                   onPressed: () {
// //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ChangeProfile(uid: user.uid,)));

//                   },
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MainPage()));
                    },
                    elevation: 5,
                    color: darkBlue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text("Back To Home",
                          style: GoogleFonts.quicksand(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2)),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
