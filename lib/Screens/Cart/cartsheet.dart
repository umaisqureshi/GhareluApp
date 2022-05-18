import 'package:flutter/material.dart';

import 'package:gharelu_app/ModelClass/cartModel.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'checkout/checkout.dart';

class CheckCard extends StatefulWidget {
  @override
  _CheckCardState createState() => _CheckCardState();
}

class _CheckCardState extends State<CheckCard> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CardsProviders>(context, listen: false);
    Size _size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: 30, // getProportionateScreenWidth(15),
          horizontal: 40 //getProportionateScreenWidth(30),
          ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: _size.height * 0.1, //getProportionateScreenWidth(40),
                  width: _size.width * 0.2, //getProportionateScreenWidth(40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset("assets/images/carts.jpg"),
                ),
                Spacer(),
                const SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                )
              ],
            ),
            SizedBox(height: 40), //getProportionateScreenHeight(20)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Total:\n",
                    style: GoogleFonts.quicksand(),
                    children: [
                      TextSpan(
                        // text: widget.tamount.toString(),
                        text: "Rs ${cart.totalAmount}",
                        style: TextStyle(fontSize: 22, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: _size.width * 0.4,
                  height:
                      _size.height * 0.07, //getProportionateScreenWidth(190),
                  child: cart.totalAmount == 0.0
                      ? Text(
                          "PLease Add Some Product",
                          style: GoogleFonts.quicksand(
                              color: Colors.blue, fontSize: 10),
                        )
                      : RaisedButton(
                          color: Colors.blueAccent,
                          shape: StadiumBorder(),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CheckOutPage()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Center(
                                child: Text(
                              'CheckOut',
                              style: GoogleFonts.quicksand(color: Colors.white),
                            )),
                          ),
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Future showPopupBox(
//   BuildContext context,
// ) {
//   return showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) => Dialog(
//             child: Container(
//               height: 250,
//               width: 200,
//               color: Colors.blueAccent,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: IconButton(
//                           icon: Icon(Icons.close, color: Colors.white),
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                         ),
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width * 0.6,
//                     child: TextFormField(
//                       keyboardType: TextInputType.number,
//                       decoration: InputDecoration(
//                           focusColor: Colors.white,
//                           fillColor: Colors.white,
//                           hintText: "6-digit code",
//                           hintStyle: TextStyle(
//                             color: Colors.white,
//                             fontSize: 10,
//                           ),
//                           // border: OutlineInputBorder(
//                           //   borderRadius: new BorderRadius.circular(25.0),
//                           //   borderSide: new BorderSide(),
//                           // ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(
//                                 color: Colors.white, width: 2.0),
//                             borderRadius: BorderRadius.circular(25.0),
//                           ),
//                           labelText: 'Voucher',
//                           labelStyle: TextStyle(
//                               color: Colors.white,
//                               letterSpacing: 2,
//                               fontSize: 15)),
//                       validator: (value) {
//                         if (value.length != 6) {
//                           return null;
//                         }
//                         return "Please enter a valid OTP code.";
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     height: 40,
//                   ),
//                   SizedBox(
//                     width: 200,
//                     height: 50,
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(20),
//                       child: RaisedButton(
//                         onPressed: () {},
//                         color: Colors.white,
//                         child: Center(child: Text('Apply Voucher')),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ));
// }
