import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gharelu_app/Screens/Location/CurrentLocation.dart';





import 'package:google_fonts/google_fonts.dart';


class Otpscreen extends StatefulWidget {
  @override
  _OtpscreenState createState() => _OtpscreenState();
}

class _OtpscreenState extends State<Otpscreen> {
  TextEditingController otpInputController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  scale: 18,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "6-digit code",
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                      labelText: 'OTP code',
                      labelStyle: TextStyle(
                          color: Colors.white, letterSpacing: 2, fontSize: 15)),
                  controller: otpInputController,
                  validator: (value) {
                    if (value.length == 6) {
                      return "Please enter a valid OTP code.";
                    }
                    return null;
                  },
                ),
              ),
            
              
           
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  height: 50,
                  width: 200,
                  child: RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CurrentLocation()));

                      },
                      elevation: 5,
                      color: Colors.blue[600],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text("VERIFY",
                            style: GoogleFonts.quicksand(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2)),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
