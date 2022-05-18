import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gharelu_app/Screens/Items/pizzaDetails.dart';


import 'package:google_fonts/google_fonts.dart';

class Burger extends StatefulWidget {
  @override
  _BurgerState createState() => _BurgerState();
}

class _BurgerState extends State<Burger> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Burger",
            style: GoogleFonts.quicksand(color: Colors.white, fontSize: 15)),
        centerTitle: true,
      ),
      floatingActionButton: null,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("ExploreCards")
            .where("foodtype", isEqualTo: "Burger")
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            final List<DocumentSnapshot> documents = snapshot.data.docs;
            return ListView(
              children: documents.map((doc) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PizzaDetails(
                              area: doc['Area of Delivery'],
                              description: doc['description'],
                              image: doc['image'],
                              names: doc['name'],
                              price: doc['price'],
                              time: doc['deliveryTime'],
                              venderId: doc['vendorId'],
                              vendername: doc['vendorName'],
                            )));
                  },
                  child: Card(
                    elevation: 50,
                    shadowColor: Colors.black,
                    color: Colors.greenAccent[100],
                    shape: RoundedRectangleBorder(),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Opacity(
                            opacity: 0.80,
                            child: Image.network(
                              doc['image'],
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                              bottom: 55,
                              right: 10,
                              child: Text(doc['name'],
                                  style: GoogleFonts.quicksand(
                                      color: Colors.white, fontSize: 12))),
                          Positioned(
                              bottom: 40,
                              right: 10,
                              child: Text(doc['foodtype'],
                                  style: GoogleFonts.quicksand(
                                      color: Colors.white, fontSize: 10))),
                          Positioned(
                              bottom: 10,
                              right: 10,
                              child: Text(doc['rating'],
                                  style: GoogleFonts.quicksand(
                                      color: Colors.white, fontSize: 10))),
                          Positioned(
                              top: 20,
                              right: 10,
                              child: Text(doc['price'],
                                  style: GoogleFonts.quicksand(
                                      color: Colors.white, fontSize: 15))),
                          // Positioned(
                          //     bottom: 10,
                          //     right: 80,
                          //     child: Container(
                          //       height: 20,
                          //       width: 80,
                          //       decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(10),
                          //         color: Colors.blueAccent,
                          //       ),
                          //       child: Center(
                          //         child: Text(doc['availibility'],
                          //             style: GoogleFonts.quicksand(
                          //                 color: Colors.white, fontSize: 10)),
                          //       ),
                          //     )),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
