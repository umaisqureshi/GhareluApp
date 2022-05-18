import 'package:flutter/material.dart';
import 'package:gharelu_app/Screens/Cart/Cart.dart';
import 'package:gharelu_app/Screens/Explore/Explore.dart';


import 'package:google_fonts/google_fonts.dart';

class ButtomNavigator extends StatefulWidget {
  @override
  _ButtomNavigatorState createState() => _ButtomNavigatorState();
  
}

class _ButtomNavigatorState extends State<ButtomNavigator> {
  @override
  Widget build(BuildContext context) {
    
    return  SizedBox(
      height: MediaQuery.of(context).size.height*0.15,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             
              RaisedButton(
                shape: StadiumBorder(),
                color: Colors.blueAccent,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          ExplorePage()));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
                  child: Column(
                    children: [
                      Icon(Icons.explore, color: Colors.white),
                      Text(
                        "Explore",
                        style: GoogleFonts.quicksand(
                          color: Colors.white,
                          letterSpacing: 2,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              RaisedButton(
                shape: StadiumBorder(),
                color: Colors.blueAccent,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddToCart(
                           
                          )));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 20),
                  child: Column(
                    children: [
                      Icon(
                        Icons.shopping_basket,
                        color: Colors.white,
                      ),
                      Text(
                        "Cart",
                        style: GoogleFonts.quicksand(
                          color: Colors.white,
                          letterSpacing: 2,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                     
                    ],
                  ),
                ),
              )
              
            ],
          
        ),
      ),
    );
  }
}
