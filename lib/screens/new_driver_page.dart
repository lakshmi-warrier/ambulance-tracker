import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
                                  color: Color.fromRGBO(143, 148, 251, 1),
                                  width: 2.0),
                              borderRadius: new BorderRadius.circular(20),
                            ),
                            hintText: "Driver's Name"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: RichText(
                            text: TextSpan(
                                text: "Registration ID",
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
                            return "Please Enter the ID";
                          }
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(143, 148, 251, 1),
                                  width: 2.0),
                              borderRadius: new BorderRadius.circular(20),
                            ),
                            hintText: "Reg. ID"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: RichText(
                            text: TextSpan(
                                text: "Years of experience",
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
                            return "Please enter the years of experience";
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(143, 148, 251, 1),
                                  width: 2.0),
                              borderRadius: new BorderRadius.circular(20),
                            ),
                            hintText: "Enter years of experience"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                RaisedButton(
                    child: Text("Cancel"),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                RaisedButton(
                    child: Text("Add Driver"),
                    onPressed: () {
                      Fluttertoast.showToast(
                          msg: "Driver added",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      Navigator.pop(context);
                    })
              ])
            ],
          ),
        ),
      )),
    );
  }
}
