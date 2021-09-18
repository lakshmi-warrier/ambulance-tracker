import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewDriversCode extends StatefulWidget {
  @override
  _NewDriversCodeState createState() => _NewDriversCodeState();
}

class _NewDriversCodeState extends State<NewDriversCode> {
  bool generated = false;
  var _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final visitorsController = TextEditingController();
  final timeController = TextEditingController();
  var data = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
          child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: RichText(
                    text: TextSpan(
                        text: "Add New Drivers",
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.black,
                        ))),
              ),
              SizedBox(
                height: 20,
              ),
              RichText(
                  text: TextSpan(
                      text: "Details",
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.black,
                      ))),
              SizedBox(
                height: 20,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: RichText(
                            text: TextSpan(
                                text: "Name",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ))),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter name";
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blue.shade200, width: 2.0),
                              borderRadius: new BorderRadius.circular(20),
                            ),
                            hintText: "Visitors Name"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: RichText(
                            text: TextSpan(
                                text: "Visitors",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ))),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: visitorsController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter No: of visitors";
                          }
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blue.shade200, width: 2.0),
                              borderRadius: new BorderRadius.circular(20),
                            ),
                            hintText: "Enter No: of visitors"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: RichText(
                            text: TextSpan(
                                text: "Time",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ))),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: timeController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter the time";
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blue.shade200, width: 2.0),
                              borderRadius: new BorderRadius.circular(20),
                            ),
                            hintText: "Enter Time eg: (7 pm)"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
