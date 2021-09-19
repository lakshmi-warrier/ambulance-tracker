import 'package:ambulance_tracker/screens/new_driver_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'all_drivers.dart';

class HospitalPage extends StatefulWidget {
  const HospitalPage({Key? key}) : super(key: key);

  @override
  _HospitalPageState createState() => _HospitalPageState();
}

class _HospitalPageState extends State<HospitalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
       color: Color.fromRGBO(143, 148, 251, 0.75),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [

                          Align(
                            alignment: Alignment.topCenter,
                            child: RichText(
                              text: TextSpan(
                                  text:
                                      "Hospital Dashboard         ", //let the spaces be for alignment
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: RichText(
                              text: TextSpan(
                                  text: "You have got 3 requests\ncurrently!",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                      Container(
                        height: 190,
                        child: PageView(
                          controller: PageController(viewportFraction: 0.9),
                          scrollDirection: Axis.horizontal,
                          pageSnapping: true,
                          children: <Widget>[
                            _buildRequestsCard(
                                title: "Patient 1 Name", subject: "Location"),
                            _buildRequestsCard(
                                title: "Patiet 2 Name", subject: "Location"),
                            _buildRequestsCard(
                                title: "Patient 3 Name", subject: "Location")
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: double.infinity,
                  maxHeight: double.infinity,
                ),
                child: Container(
                  height: 425,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 0.5,
                        spreadRadius: 0.0,
                        offset: Offset(
                            -1.0, -1.0), // shadow direction: bottom right
                      )
                    ],
                  ),
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: new SingleChildScrollView(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15),
                        RichText(
                            text: TextSpan(
                                text: "Overview",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ))),
                        SizedBox(height: 25),
                        Container(
                          height: 250,
                          child: PageView(
                            controller: PageController(
                                viewportFraction: 0.5, initialPage: 1),
                            scrollDirection: Axis.horizontal,
                            pageSnapping: false,
                            children: <Widget>[
                              _buildItemCard(
                                  title: "Available Drivers",
                                  total: "Total: 8",
                                  totalNum: 8,
                                  color: Colors.blue,
                                  icon: FontAwesomeIcons.addressCard,
                                  onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ShowDrivers()),
                                      )),
                              _buildItemCard(
                                title: "Along the\nWay",
                                total: "Total: 5",
                                totalNum: 5,
                                color: Colors.red,
                                icon: FontAwesomeIcons.ambulance,
                                //   onTap: () => Navigator.push(
                                //       context,
                                //     MaterialPageRoute(
                                //       builder: (context) =>
                                //         EventsTimeline()),)
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemCard(
      {required String title,
      String? total,
      String? used,
      required int totalNum,
      Color? color,
      IconData? icon,
      GestureTapCallback? onTap}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(24),
        child: InkWell(
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(
                children: [
                  WidgetSpan(
                      child: FaIcon(
                    icon,
                    color: color,
                    size: 30,
                  )),
                ],
              )),
              SizedBox(height: 25),
              RichText(
                  text: TextSpan(
                      text: title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                      ))),
              SizedBox(height: 10),
              Divider(
                thickness: 1,
              ),
              RichText(
                  text: TextSpan(
                      text: total,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ))),
              SizedBox(height: 10),
              RichText(
                  text: TextSpan(
                      text: used,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ))),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRequestsCard({
    required String title,
    String? subject,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                  text: title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                  text: subject,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  )),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
