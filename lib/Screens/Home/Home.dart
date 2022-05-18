import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:gharelu_app/ModelClass/locationModel.dart';
import 'package:gharelu_app/Screens/Items/burger.dart';
import 'package:gharelu_app/Screens/Items/chinese.dart';
import 'package:gharelu_app/Screens/Items/deserts.dart';
import 'package:gharelu_app/Screens/Items/pizza.dart';
import 'package:gharelu_app/Screens/Items/salan.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'drawer.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var add;
  var add2;

  Future getAddress() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var currentAddress = sharedPreferences.getString('Address');
    setState(() {
      add2 = currentAddress;
    });
  }

  Location location;
  @override
  void initState() {
    super.initState();

    getAddress();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      drawerScrimColor: Colors.transparent,
      drawer: Drawers(),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.blue,
            Colors.blue,
          ])),
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          "Gharelu",
          style: GoogleFonts.aBeeZee(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 2,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0, top: 25),
            child: Text(
              add2.toString(),
              style: GoogleFonts.quicksand(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 10),
                child: Text(
                  "SPECIAL OFFERS",
                  style: GoogleFonts.quicksand(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection("Slider").snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    final List<DocumentSnapshot> documents = snapshot.data.docs;
                    return CarouselSlider(
                      items: [
                        //1st Image of Slider
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            image: DecorationImage(
                              image: NetworkImage(documents[0]['image']),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            image: DecorationImage(
                              image: NetworkImage(documents[1]['image']),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            image: DecorationImage(
                              image: NetworkImage(documents[2]['image']),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],

                      //Slider Container properties
                      options: CarouselOptions(
                        height: 230.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 2.5,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 0.9,
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, left: 10),
                child: Text(
                  "SPECIAL FOR YOU",
                  style: GoogleFonts.quicksand(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    cardIcons("assets/images/pizzalogo.png", "Italian", context,
                        () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => pizza()));
                    }),
                    cardIcons(
                        "assets/images/burgerlogo.png", "Fast Food", context,
                        () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Burger()));
                    }),
                    cardIcons("assets/images/Chinese.png", "Chinese", context,
                        () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Chinese()));
                    }),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    cardIcons("assets/images/desert.png", "Deserts", context,
                        () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Deserts()));
                    }),
                    cardIcons("assets/images/salan.png", "Salan", context, () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Salan()));
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget cardIcons(
  String image,
  String name,
  BuildContext context,
  Function fun,
) {
  Size size = MediaQuery.of(context).size;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
    child: InkWell(
      onTap: fun,
      child: Card(
        color: Colors.white,
        elevation: 5,
        borderOnForeground: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Container(
          height: size.height * 0.15,
          width: size.width * 0.26,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.02),
              SizedBox(
                height: 60,
                width: 60,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              Text(name,
                  style: GoogleFonts.quicksand(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 8))
            ],
          )),
        ),
      ),
    ),
  );
}
