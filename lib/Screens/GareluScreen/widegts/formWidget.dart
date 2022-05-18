import 'package:flutter/material.dart';
import 'package:gharelu_app/Screens/Login/Widgets/RoundedInputField.dart';



import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';



class Myprofile extends StatefulWidget {
  @override
  _MyprofileState createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {
  DateTime selectedDate;
  String selectedgender = "";

  DateTime newDate;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    void presentDatePicker() {
      showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2019),
              lastDate: DateTime.now())
          .then((value) {
        if (value == null) {
          return;
        }
        setState(() {
          selectedDate = value;
        });
      });
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 15, bottom: 0),
            child: Text(
              "Save",
              style: GoogleFonts.quicksand(),
            ),
          ),
        ],
        title: Text(
          "My Profile",
          style: GoogleFonts.aBeeZee(),
        ),
        centerTitle: true,
        flexibleSpace: Container(
            decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xff0674BD), Color(0xff17A1FF)]),
        )),
        elevation: 0,
      ),
      drawer: Drawer(),
      body: Container(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.04,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Name",
                        style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    RounderTextField(
                      hint: null,
                      icon: null,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Relation",
                        style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    RounderTextField(
                      hint: null,
                      icon: null,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("CNIC #",
                        style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    RounderTextField(
                      hint: null,
                      icon: null,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Addr. ",
                        style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    RounderTextField(
                      hint: null,
                      icon: null,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("City   ",
                        style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    RounderTextField(
                      hint: null,
                      icon: null,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Gender",
                        style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    Text(selectedgender,
                        style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.white)),
                    Container(
                        child: DropdownButton<String>(
                      items: <String>[
                        'Male',
                        'Female',
                      ].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (_selectedGender) {
                        setState(() {
                          selectedgender = _selectedGender;
                        });
                      },
                    )),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Date Of Birth",
                        style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    Column(
                      children: [
                        RaisedButton(
                          elevation: 5,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          onPressed: () {
                            presentDatePicker();
                          },
                          child: Icon(
                            Icons.calendar_today,
                          ),
                        ),
                        Text(
                          selectedDate == null
                              ? 'No date choosen'
                              : DateFormat.yMMMd().format(selectedDate),
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
