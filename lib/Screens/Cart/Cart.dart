import 'package:flutter/material.dart';

import 'package:gharelu_app/ModelClass/cartModel.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'cartsheet.dart';

class AddToCart extends StatefulWidget {
  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CardsProviders>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add To Cart",
          style: GoogleFonts.quicksand(),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
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
          trailing: Text(
            cart.items.values.toList()[index].price,
            style: GoogleFonts.quicksand(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        itemCount: cart.items.length,
      ),
      bottomNavigationBar: CheckCard(),
    );
  }
}
