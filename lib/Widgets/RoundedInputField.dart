import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'TextFieldContainer.dart';

class RounderTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final Function onchanged;
  const RounderTextField({Key key, this.hint, this.icon, this.onchanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldCOntainer(
        child: TextFormField(
          style: GoogleFonts.quicksand(color: Colors.blue),
      onChanged: onchanged,
      decoration: InputDecoration(
          labelText: hint,
          border: InputBorder.none,
          icon: Icon(
            icon,
            color: Colors.yellow,
          ),
          labelStyle: GoogleFonts.quicksand(
                    fontSize: 10,
                    color:Colors.blue
                  )),
    ));
  }
}
