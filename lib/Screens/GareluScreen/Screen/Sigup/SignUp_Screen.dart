import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gharelu_app/Database/User_Registration_database_service.dart';


import 'package:gharelu_app/ModelClass/UserModel.dart';
import 'package:gharelu_app/Screens/GareluScreen/widegts/ConstantColors.dart';
import 'package:gharelu_app/Screens/Location/CurrentLocation.dart';
import 'package:gharelu_app/Screens/Login/Widgets/RoundedInputField.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SignUp extends StatelessWidget {
  User user;

  final String phone;

  String _name, _address;

  SignUp({this.user, this.phone});
  final GlobalKey<FormState> _signup = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final userr = Provider.of<UserProvider>(context);

    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Container(
        width: double.infinity,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: size.height * 0.3,
              ),
              Stack(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 20, 30, 15),
                      child: Text('Create an Account',
                          style: GoogleFonts.quicksand(
                              color: Colors.blue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                    margin: EdgeInsets.only(left: 40),
                    width: size.width * 0.7,
                    height: size.height * 0.53,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 63, top: 55),
                    child: Form(
                      key: _signup,
                      child: Column(
                        children: [
                          RounderTextField(
                            hint: 'Name',
                            icon: Icons.person,
                            onchanged: (value) async {
                              _name = value;
                              final SharedPreferences sharedPreferences =
                                  await SharedPreferences.getInstance();
                              sharedPreferences.setString('Name', _name);
                            },
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          RounderTextField(
                            hint: 'Address',
                            icon: Icons.house,
                            onchanged: (value) async {
                              _address = value;
                              final SharedPreferences sharedPreferences =
                                  await SharedPreferences.getInstance();
                              sharedPreferences.setString('address', _address);
                            },
                          ),
                          SizedBox(
                            height: size.height * 0.13,
                          ),
                          SizedBox(
                            height: size.height * 0.07,
                            width: size.width * 0.4,
                            child: RaisedButton(
                                onPressed: () async {
                                  if (_signup.currentState.validate()) {
                                    final SharedPreferences sharedPreferences =
                                        await SharedPreferences.getInstance();

                                    sharedPreferences.setString('id', user.uid);

                                    sharedPreferences.setString(
                                        'phone', phone.toString());

                                    await DatabaseService(user.uid)
                                        .CreateUserData(
                                      _name,
                                      phone,
                                      _address,
                                    );
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CurrentLocation()));

                                    userr.addUser(_name, _address, user.uid);
                                  }
                                },
                                elevation: 5,
                                color: darkBlue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: Text("Register",
                                      style: GoogleFonts.quicksand(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 2)),
                                )),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
