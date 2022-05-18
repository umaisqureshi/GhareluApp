import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

String uid;

class OrderHistory extends StatefulWidget {
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  Future getUser() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var id = sharedPreferences.getString('id');
    setState(() {
      uid = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final ur = Provider.of<UserProvider>(context);
    // var uid = ur.userr.values.toList()[0].id;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Order History",
            style: GoogleFonts.quicksand(color: Colors.white, fontSize: 15)),
        centerTitle: true,
      ),
      floatingActionButton: null,
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("Orders")
              .where("UserId", isEqualTo: uid)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              final List<DocumentSnapshot> documents = snapshot.data.docs;
              return ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: documents.map((doc) {
                  return InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(
                                      0, 1), // changes position of shadow
                                ),
                              ]),
                          //color: Colors.pink,
                          height: size.height * 0.2,
                          width: size.width * 0.95,
                          margin: EdgeInsets.only(top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // Name and Price...................................
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: size.height * 0.08,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 20,
                                    ),
                                    child: Text(
                                      "Name: ",
                                      style: GoogleFonts.quicksand(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.08,
                                  ),
                                  Container(
                                    //margin: EdgeInsets.only(top: 20),
                                    child: Text(
                                      doc['ProductName'],
                                      style: GoogleFonts.quicksand(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  SizedBox(
                                    height: size.height * 0.08,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 20),
                                    child: Text(
                                      "Rs. " + doc['Cost'],
                                      style: GoogleFonts.quicksand(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        // Address .........................................
                                        Container(
                                          margin: EdgeInsets.only(
                                            left: 20,
                                          ),
                                          child: Text(
                                            doc['Address'],
                                            style: GoogleFonts.quicksand(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),

                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),

                                        // Date.............................................
                                        Container(
                                          margin: EdgeInsets.only(
                                            left: 20,
                                          ),
                                          child: Text(
                                            doc['status'],
                                            style: GoogleFonts.quicksand(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: SizedBox(
                                          height: 50,
                                          width: 50,
                                          child: ClipOval(
                                              child:
                                                  Image.network(doc['Image']))),
                                    ),
                                    Container(),
                                  ],
                                ),
                              ),

                              Container(),
                            ],
                          ),
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
      ),
    );
  }
}
