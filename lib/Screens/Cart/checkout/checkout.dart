import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:gharelu_app/Database/User_Registration_database_service.dart';
import 'package:gharelu_app/ModelClass/OrderModel.dart';

import 'package:gharelu_app/ModelClass/cartModel.dart';
import 'package:gharelu_app/Widgets/successfulScreen.dart';


import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';



double results1, results2;
String location;

class CheckOutPage extends StatefulWidget {
  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  String area, ids, addresss, namee, phone;

  Future getCoor(String address) async {
    var coor = await Geocoder.local.findAddressesFromQuery(address);
    setState(() {
      results1 = coor.first.coordinates.latitude;
      results2 = coor.first.coordinates.longitude;
      print(results1);
    });
  }

  Future getUser() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var id = sharedPreferences.getString('id');
    var address = sharedPreferences.getString('address');
    var name = sharedPreferences.getString('Name');

    setState(() {
      ids = id;
      addresss = address;
      namee = name;
    });
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CardsProviders>(context);
    // final ur = Provider.of<UserProvider>(context);
    final order = Provider.of<OrderProvider>(context);
    //my  final address = Provider.of<AddressProvider>(context);
    double total = cart.totalAmount + 50;
    //  var userid = ur.userr.values.toList()[0].id;
    // TextEditingController _controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          " CheckOut ",
          style: GoogleFonts.quicksand(),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) => ListTile(
                onTap: () {},
                leading: SizedBox(
                  height: 50,
                  width: 50,
                  child: ClipOval(
                    child: Image.network(
                      cart.items.values.toList()[index].image,
                      fit: BoxFit.cover,
                      width: 45,
                    ),
                  ),
                ),
                title: Text(
                  cart.items.values.toList()[index].title,
                  style: GoogleFonts.quicksand(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  cart.items.values.toList()[index].quantity.toString(),
                  style: GoogleFonts.quicksand(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
              ),
              itemCount: cart.items.length,
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Delivery Charges",
                    style: GoogleFonts.quicksand(
                      fontSize: 15,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "50",
                    style: GoogleFonts.quicksand(
                      fontSize: 15,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Cost",
                    style: GoogleFonts.quicksand(
                      fontSize: 15,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    total.toString(),
                    style: GoogleFonts.quicksand(
                      fontSize: 15,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                addresss,
                style: GoogleFonts.quicksand(
                  fontSize: 12,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 40),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        cursorHeight: 25,
                        // controller: _controller,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          setState(() {
                            area = value;
                          });
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            Text("Please Enter Delivery Address");
                          }
                        },
                        style: GoogleFonts.quicksand(color: Colors.blue),
                        decoration: InputDecoration(
                            hintText: "Delivery Address",
                            border: InputBorder.none,
                            hintStyle: GoogleFonts.quicksand(
                              fontSize: 10,
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            )),
                      ),
                    ),
                  ),
                ),
                RaisedButton(
                  color: Colors.blue,
                  onPressed: () {
                    getCoor(area);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Add",
                      style: GoogleFonts.quicksand(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    cursorHeight: 25,
                    // controller: _controller,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      setState(() {
                        phone = value;
                      });
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        Text("Please Enter Your Number");
                      }
                    },
                    style: GoogleFonts.quicksand(color: Colors.blue),
                    decoration: InputDecoration(
                        hintText: "Phone Number",
                        border: InputBorder.none,
                        hintStyle: GoogleFonts.quicksand(
                          fontSize: 10,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            area == null
                ? Center(
                    child: Text(
                    "Please Enter Delivery Address",
                    style: GoogleFonts.quicksand(color: Colors.blue),
                  ))
                : Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: RaisedButton(
                      color: Colors.blueAccent,
                      shape: StadiumBorder(),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SucessfulScreen()));

                        OrderData().SubmitOrder(
                            order.order.values.toList()[0].productId,
                            order.order.values.toList()[0].name,
                            order.order.values.toList()[0].venderId,
                            total.toString(),
                            order.order.values.toList()[0].quantity,
                            cart.items.values.toList()[0].image,
                            "Pending",
                            ids,
                            area,
                            cart.items.values.toList()[0].title,
                            phone,
                            results1,
                            results2,
                            order.order.values.toList()[0].vendernumber);

                        cart.clearCart();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(25),
                        child: Center(
                            child: Text(
                          'Confirm Order',
                          style: GoogleFonts.quicksand(color: Colors.white),
                        )),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
