import 'package:ambulance_tracker/services/current_location.dart';
import 'package:flutter/material.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';


class DriverPage extends StatefulWidget {
  const DriverPage({Key? key}) : super(key: key);

  @override
  _DriverPageState createState() => _DriverPageState();
}

var loc = [];
String currLoc = "";
String address = "";
bool isWorking = false;
bool isAvailable = true;

class _DriverPageState extends State<DriverPage> {
  @override
  void initState() {
    super.initState();
    currentLoc();
  }

  @override
  Widget build(BuildContext context) {
    currentLoc();

    return Scaffold(
      appBar: AppBar(
          title: Text("Driver page"),
          backgroundColor: Color.fromRGBO(143, 148, 251, 1),

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width - 40,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 8,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            child: Image.network(
                                "https://static.wikia.nocookie.net/pokemon/images/8/88/Char-Eevee.png/revision/latest?cb=20190625223735"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Name: _______________"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Available: ",
                    style: TextStyle(fontSize: 20),
                  ),
                  SlidingSwitch(
                    value: false,
                    width: 200,
                    onChanged: (bool value) {
                      Fluttertoast.showToast(
                          msg: !value
                              ? "You won't be called for help till you are free"
                              : "You'll be notified when we need your help",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    },
                  ),

                ],
              ),

            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Working: ",
                  style: TextStyle(fontSize: 28),
                ),
                SlidingSwitch(
                  value: false,
                  width: 200,
                  onChanged: (bool value) {
                    isWorking = !value;
                    if (isWorking) isAvailable = false;
                    setState(() {
                      isWorking;
                      isAvailable;
                    });
                  },
                ),

              ],
            ),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width - 20,
              height: MediaQuery
                  .of(context)
                  .size
                  .height / 2,
              child: !isWorking
                  ? patientData()
                  : Card(
                child: Image.network(
                    "https://img.freepik.com/free-vector/lazy-raccoon-sleeping-cartoon_125446-631.jpg?size=338&ext=jpg"),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget patientData() {
    return GestureDetector(
      onTap: () async {
        currentLoc();

        //address = currLoc.split("{}")[2];
        //loc = currLoc.split("{}")[1].split(" , ");
        address = "Patient's address";
        loc = [0, 0];

        setState(() {
          loc;
          address;
        });
      },
      child: Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Current Patient",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Image.network(
                  "https://www.zyrgon.com/wp-content/uploads/2019/06/googlemaps-Zyrgon.jpg"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(address),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Location: 0, 0"),
              ),
            ],
          )),
    );
  }

  void currentLoc() async {
    currLoc = await getLoc();
  }
}
