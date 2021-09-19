import 'package:flutter/material.dart';

import 'new_driver_page.dart';
import 'package:ambulance_tracker/services/drivers.dart';

class ShowDrivers extends StatefulWidget {
  const ShowDrivers({Key? key}) : super(key: key);

  @override
  _ShowDriversState createState() => _ShowDriversState();
}

class _ShowDriversState extends State<ShowDrivers> {
  @override
  Widget build(BuildContext context) {
    sortDrivers();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("All drivers"),
          backgroundColor: Color.fromRGBO(143, 148, 251, 1),
          bottom: TabBar(tabs: [
            Tab(
              text: "All",
            ),
            Tab(text: "Working"),
            Tab(text: "Offline"),
          ]),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.person_add_alt_1,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewDriversCode()),
                    )),
          ],
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                children: sortDrivers(),
              ),
            ),
            Column(children: []),
            Column(
              children: [],
            ),
          ],
        ),
      ),
    );
  }

  Widget driverCard(String name, bool isFree, bool isAvailable, String regId) {
    Color col = Colors.white;
    String status = "";
    if (isFree && !isAvailable) {
      col = Color.fromRGBO(235, 233, 228, 1);
      status = "Offline";
    } else if (isFree){
      col = Color.fromRGBO(217, 250, 195, 1);
    status = "Online";}
    else if (!isFree || !isAvailable){ col = Color.fromRGBO(250, 152, 152, 1);status = "Busy";}

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
          width: MediaQuery.of(context).size.width - 50,
          height: MediaQuery.of(context).size.height / 6,
          child: Card(
            child: Column(children: [Text(name), Text(regId), Text(status)]),
            color: col,
          )),
    );
  }

  List<Widget> sortDrivers() {
    List<Widget> lst = [];

    for (var e in drivers) {
      lst.add(
          driverCard(e['name'], e["isFree"], e["isAvailable"], e["reg_id"]));
    }

    return lst;
  }
}
