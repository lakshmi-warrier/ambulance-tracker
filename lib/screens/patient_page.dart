import 'package:ambulance_tracker/services/MapUtils.dart';
import 'package:ambulance_tracker/services/current_location.dart';
import 'package:flutter/material.dart';

class PatientPage extends StatefulWidget {
  const PatientPage({Key? key}) : super(key: key);

  @override
  _PatientPageState createState() => _PatientPageState();
}

String currLoc = "";
var details = [];
String  date_time="",address="";
var loc=[];

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
              child: Text("Get current location"),
              onPressed: () async {
                currentLoc();

                date_time =  currLoc.split("{}")[0];
                address = currLoc.split("{}")[2];
                loc = currLoc.split("{}")[1].split(" , ");


                setState(() {
                  currLoc;
                  date_time;
                  address;
                  loc;
                });
              }),
          Text(currLoc),
          RaisedButton(
              child: Text("See nearby hospitals in GMap"),
              onPressed: () async {
                print(loc);
                MapUtils.openMap( double.parse(loc[0]), double.parse(loc[1]));
              }),
        ],
      ),
    ));
  }

  void currentLoc() async {
    currLoc = await getLoc();
  }


}
