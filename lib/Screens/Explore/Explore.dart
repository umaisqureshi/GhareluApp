import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:google_fonts/google_fonts.dart';

import 'ExploreDetail.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore",
            style: GoogleFonts.quicksand(color: Colors.white, fontSize: 15)),
        centerTitle: true,
      ),
      floatingActionButton: null,
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection("ExploreCards").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            final List<DocumentSnapshot> documents = snapshot.data.docs;
            return ListView(
              children: documents.map((doc) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 8),
                  child: Container(
                    height: media.height * 0.25,
                    width: media.width * 0.95,
                    color: Colors.blueAccent,
                    child: Card(
                        color: Colors.black12,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Stack(
                          overflow: Overflow.visible,
                          children: [
                            Positioned(
                              top: 20,
                              left: 15,
                              child: Container(
                                height: media.height * 0.18,
                                width: media.width * 0.35,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                                child: Image.network(doc['image'],
                                  fit: BoxFit.fitHeight,),
                              ),
                            ),
                            Positioned(
                              top: 65,
                              left: 345,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: IconButton(
                                  icon: new Icon(Icons.arrow_forward_ios_outlined),

                                  onPressed:(){
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => ExploreDetails(
                                          area: doc['Area of Delivery'],
                                          description: doc['description'],
                                          image: doc['image'],
                                          names: doc['name'],
                                          price: doc['price'],
                                          productId: doc['productId'],
                                          time: doc['deliveryTime'],
                                          venderId: doc['vendorId'],
                                          vendername: doc['vendorName'],
                                          venderNumber: doc['VenderNumber'],
                                        )));

                                  }, // null disables the button
                                ),
                              ),
                            ),
                            Positioned(
                                left: 190,
                                top: 25,
                                child: Text(
                                  doc['name'],
                                  style: GoogleFonts.quicksand(
                                      fontSize: 24, fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                            Positioned(
                                left: 195,
                                top: 120,
                                child: Text(
                                  doc['price'],
                                  style: GoogleFonts.quicksand(
                                      fontSize: 18,
                                      color: Colors.white),
                                )),
                            Positioned(
                              left: 170,
                              top: 50,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20, top: 10),
                                child: RatingBar.builder(
                                  initialRating: 4.5,
                                  ignoreGestures: true,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemSize: 25,
                                  itemCount: 5,
                                  itemPadding:
                                  EdgeInsets.symmetric(horizontal: 1.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.yellowAccent,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                              ),),

                          ],
                        )),
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
