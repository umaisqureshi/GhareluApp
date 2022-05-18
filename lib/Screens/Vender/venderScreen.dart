import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:gharelu_app/ModelClass/OrderModel.dart';
import 'package:gharelu_app/ModelClass/cartModel.dart';
import 'package:gharelu_app/Screens/Explore/ExploreDetail.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VenderScreen extends StatefulWidget {
  @override
  _VenderScreenState createState() => _VenderScreenState();
  String venderId;
  VenderScreen({this.venderId});
}

class _VenderScreenState extends State<VenderScreen> {
  int numbers = 1;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CardsProviders>(context);
    final order = Provider.of<OrderProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Vender_Detail')
              .where("Uid", isEqualTo: widget.venderId)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              final List documents = snapshot.data.docs;
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: documents.map((docs) {
                  return Column(
                    children: [
                      Stack(
                        overflow: Overflow.visible,
                        children: [
                          SizedBox(
                            height: 250,
                            width: double.maxFinite,
                            child: Image.network(
                              docs['Image'],
                              fit: BoxFit.contain,
                            ),
                          ),
                          Positioned(
                              bottom: -50,
                              left: MediaQuery.of(context).size.width * 0.35,
                              child: CircleAvatar(
                                  radius: 50.0,
                                  backgroundColor: Colors.blueAccent,
                                  child: Image.asset(
                                      // documents[widget.number]['logo']),
                                      "assets/images/logo.png")))
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 5),
                        child: Text(
                          docs['name'],
                          style: GoogleFonts.quicksand(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15.0,
                        ),
                        child: Text(
                          docs['Area of Delivery'],
                          style: GoogleFonts.quicksand(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15.0,
                        ),
                        child: Text(
                          docs['Opening Days'],
                          style: GoogleFonts.quicksand(
                            fontSize: 10,
                            color: Colors.blue,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DefaultTabController(
                          length: 1,
                          initialIndex: 0,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Container(
                                  child: TabBar(
                                    labelColor: Colors.yellow,
                                    tabs: [
                                      Tab(
                                        text: "Menu",
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                    height: 400, //height of TabBarView
                                    decoration: BoxDecoration(
                                        border: Border(
                                            top: BorderSide(
                                                color: Colors.grey,
                                                width: 0.5))),
                                    child: TabBarView(children: <Widget>[
                                      SingleChildScrollView(
                                        child: StreamBuilder(
                                          stream: FirebaseFirestore.instance
                                              .collection('ExploreCards')
                                              .where("vendorId",
                                                  isEqualTo: widget.venderId)
                                              .snapshots(),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<QuerySnapshot>
                                                  snapshot) {
                                            if (snapshot.hasData) {
                                              final List<DocumentSnapshot>
                                                  docu = snapshot.data.docs;
                                              return ListView(
                                                shrinkWrap: true,
                                                children: docu.map((doc) {
                                                  return Card(
                                                    shadowColor: Colors.black38,
                                                    elevation: 2,
                                                    shape:
                                                        RoundedRectangleBorder(),
                                                    child: ListTile(
                                                      onTap: () {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        ExploreDetails(
                                                                          area:
                                                                              doc['Area of Delivery'],
                                                                          description:
                                                                              doc['description'],
                                                                          image:
                                                                              doc['image'],
                                                                          names:
                                                                              doc['name'],
                                                                          price:
                                                                              doc['price'],
                                                                          productId:
                                                                              doc['productId'],
                                                                          time:
                                                                              doc['deliveryTime'],
                                                                          venderId:
                                                                              doc['vendorId'],
                                                                          vendername:
                                                                              doc['vendorName'],
                                                                        )));

                                                        cart.addcart(
                                                            doc['image'],
                                                            doc['name'],
                                                            doc['Area of Delivery'],
                                                            doc['price'],
                                                            numbers,
                                                            doc['productId']);

                                                        order.addOrder(
                                                            doc['name'],
                                                            widget.venderId,
                                                            doc['productId'],
                                                            numbers,
                                                            doc['VenderNumber']);
                                                      },
                                                      leading: SizedBox(
                                                        width: 50,
                                                        height: 50,
                                                        child: ClipOval(
                                                          child: Image.network(
                                                              doc['image']),
                                                        ),
                                                      ),
                                                      title: Text(
                                                        doc['name'],
                                                        style: GoogleFonts
                                                            .quicksand(
                                                          fontSize: 12,
                                                          color: Colors.blue,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      subtitle: Text(
                                                        doc['description'],
                                                        style: GoogleFonts
                                                            .quicksand(
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                color: Colors
                                                                    .black),
                                                      ),
                                                      trailing: Text(
                                                        doc['price'],
                                                        style: GoogleFonts
                                                            .quicksand(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                              );
                                            } else {
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    ]))
                              ])),
                    ],
                  );
                }).toList(),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
