import 'package:flutter/material.dart';

import 'new_driver_page.dart';

class ShowDrivers extends StatefulWidget {
  const ShowDrivers({Key? key}) : super(key: key);

  @override
  _ShowDriversState createState() => _ShowDriversState();
}

class _ShowDriversState extends State<ShowDrivers> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("All drivers"),
          backgroundColor: Color.fromRGBO(143, 148, 251, 1),
          bottom: TabBar(tabs: [
            Tab(
              text: "Available",
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
            Column(
              children: [
                driverCard("Lakshmi", "free"),
                driverCard("Pavithra", "free"),
                driverCard("Sam", "free"),
              ],
            ),
            Column(children: [driverCard("Arya", "working")]),
            Column(
              children: [
                driverCard("Bhavana", "idle"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget driverCard(String name, String status) {
    Color col = Colors.white;

    switch (status) {
      case "idle":
        col = Color.fromRGBO(235, 233, 228, 1);
        break;
      case "free":
        col = Color.fromRGBO(217, 250, 195, 1);
        break;

      case "working":
        col = Color.fromRGBO(250, 152, 152, 1);
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
          width: MediaQuery.of(context).size.width - 50,
          height: MediaQuery.of(context).size.height / 6,
          child: Card(
            child: Text(name),
            color: col,
          )),
    );
  }
}
