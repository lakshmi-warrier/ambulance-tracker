import 'package:ambulance_tracker/services/current_location.dart';
import 'package:flutter/material.dart';

class PatientPage extends StatefulWidget {
  const PatientPage({Key? key}) : super(key: key);

  @override
  _PatientPageState createState() => _PatientPageState();
}

String currLoc = "";

class _PatientPageState extends State<PatientPage> {
  @override
  void initState() {
    super.initState();
    currentLoc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
              child: Text("Get current location (ps:not working :( )"),
              onPressed: () async {
                currentLoc();

                setState(() {
                  currLoc;
                });
              }),
          Text(currLoc),
        ],
      ),
    ));
  }

  void currentLoc() async {
    currLoc = await getLoc();
  }
}
