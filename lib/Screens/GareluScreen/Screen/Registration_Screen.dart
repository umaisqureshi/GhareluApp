import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  TextEditingController emailInputController;
  TextEditingController pwdInputController;

  @override
  initState() {

    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor :  Color(0xff0674bd),
        body:SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
                child: Form(
                  key: _registerFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Container(

                          margin : EdgeInsets.fromLTRB(10, 60, 10, 25) ,
                          child: Image.asset('assets/images/logo.png', scale: 15,)),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                              Icons.mail,
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderRadius: BorderRadius.all(Radius.circular(90.0)),
                              borderSide: BorderSide.none,
                              //borderSide: const BorderSide(),
                            ),

                            hintStyle: TextStyle(color: Colors.white,fontFamily: "WorkSansLight"),
                            filled: true,
                            fillColor: Colors.white24,
                            hintText: 'email'),
                      ),
                      SizedBox(
                        height :20
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(90.0)),
                              borderSide: BorderSide.none,

                            ),

                            hintStyle: TextStyle(color: Colors.white,fontFamily: "WorkSansLight"),
                            filled: true,
                            fillColor: Colors.white24,
                            hintText: 'Password'),
                      ),
                     SizedBox(
                       height: 40,
                     ),
                     RaisedButton(
elevation: 15,
                      onPressed: (){},
                       color: Colors.blue[400],
                       child: Text('Login',style:TextStyle(
                         letterSpacing: 2,
                         color: Colors.white,

                         fontSize: 15,

                       )) ,
                       shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10)),
                       padding: EdgeInsets.symmetric(vertical: 15, horizontal: 90),
                      )

                    ],
                  ),
                ))));
  }
}