import 'package:flutter/material.dart';

import 'package:gharelu_app/ModelClass/OrderModel.dart';

import 'package:gharelu_app/ModelClass/cartModel.dart';
import 'package:gharelu_app/Screens/Cart/Cart.dart';
import 'package:gharelu_app/Screens/Vender/venderScreen.dart';


import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ExploreDetails extends StatefulWidget {
  @override
  _ExploreDetailsState createState() => _ExploreDetailsState();
  String image,
      names,
      price,
      vendername,
      area,
      time,
      description,
      venderId,
      productId;
  int venderNumber;
  ExploreDetails(
      {this.image,
      this.names,
      this.area,
      this.description,
      this.price,
      this.time,
      this.venderNumber,
      this.vendername,
      this.productId,
      this.venderId});
}

class _ExploreDetailsState extends State<ExploreDetails> {
  int numbers = 1;
  int incremental() {
    setState(() {
      numbers++;
    });
    print(numbers);
    return numbers;
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CardsProviders>(context);
    final order = Provider.of<OrderProvider>(context);
    //final ur = Provider.of<UserProvider>(context);
    // var name = ur.userr.values.toList()[0].name;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 250,
                width: double.maxFinite,
                child: Image.network(
                  widget.image,
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.names,
                    style: GoogleFonts.quicksand(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  Text(
                    widget.price,
                    style: GoogleFonts.aBeeZee(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => VenderScreen(
                                venderId: widget.venderId,
                              )));
                    },
                    child: Text(
                      widget.vendername,
                      style: GoogleFonts.quicksand(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    color: Colors.blueAccent,
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              // SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    widget.area,
                    style: GoogleFonts.quicksand(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Delivery Time",
                    style: GoogleFonts.quicksand(
                      color: Colors.black,
                      fontSize: 10,
                    ),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  Text(
                    widget.time,
                    style: GoogleFonts.quicksand(
                      color: Colors.black,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
                child: Text(
                  widget.description,
                  style: GoogleFonts.quicksand(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),

              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Offers",
                    style: GoogleFonts.quicksand(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "If You Give Us 50 % Advance Payment , You Can Get 20 % Discount On Every Meal",
                    style: GoogleFonts.quicksand(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Quantity",
                        style: GoogleFonts.quicksand(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        RaisedButton(
                          onPressed: () {
                            incremental();
                          },
                          child: Text(
                            "+",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.blueAccent,
                          hoverColor: Colors.purpleAccent,
                        ),
                        if (numbers > 1)
                          RaisedButton(
                            onPressed: () {
                              setState(() {
                                if (numbers <= 1) {
                                  setState(() {
                                    numbers = 1;
                                  });
                                } else {
                                  numbers--;
                                  return numbers;
                                }
                              });
                            },
                            child: Text(
                              "-",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.blueAccent,
                            hoverColor: Colors.purpleAccent,
                          ),
                      ],
                    ),
                    Text(
                      "$numbers",
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () {
                    
                      order.addOrder(widget.names, widget.venderId,
                          widget.productId, numbers, widget.venderNumber);
                          
                      cart.addcart(widget.image, widget.names, widget.time,
                          widget.price, numbers, widget.productId);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => AddToCart()));
                    },
                    child: Text(
                      "Order Now",
                      style: GoogleFonts.quicksand(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    color: Colors.blueAccent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
