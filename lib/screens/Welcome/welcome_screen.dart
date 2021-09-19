// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:ambulance_tracker/screens/Login/login_screen.dart';
import 'package:ambulance_tracker/screens/Signup/signup_screen.dart';
import 'package:ambulance_tracker/Components/rounded_button.dart';
import 'package:ambulance_tracker/constants.dart';
import 'package:flutter_svg/svg.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}


  class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  // This size provide us total height and width of our screen
  return Background(
  child: SingleChildScrollView(
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
  Text(
  " TRACKIUM ",
  style: TextStyle(fontSize: 50 , fontWeight: FontWeight.bold , color: Colors.indigo)
  ),
    Positioned(
      bottom: 0,
      left: 0,
      child: Image.asset(
        "assets/images/image1_tr.png",
        width: size.width * 1.0,
      ),
    ),
  SizedBox(height: size.height * 0.05),
  RoundedButton(
  text: "LOGIN",
  press: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (context) {
  return LoginScreen();
  },
  ),
  );
  },
  ),
  RoundedButton(
  text: "SIGN UP",
  color: kPrimaryLightColor,
  textColor: Colors.black,
  press: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (context) {
  return SignUpScreen();
  },
  ),
  );
  },
  ),
  ],
  ),
  ),
  );
  }
  }

  class Background extends StatelessWidget {
  final Widget child;
  const Background({
  Key key,
  @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Container(
  height: size.height,
  width: double.infinity,
  child: Stack(
  alignment: Alignment.center,
  children: <Widget>[
  Positioned(
  top: 0,
  left: 0,
  child: Image.asset(
  "assets/images/main_top.png",
  width: size.width * 0.3,
  ),
  ),
  Positioned(
  bottom: 0,
  left: 0,
  child: Image.asset(
  "assets/images/main_bottom.png",
  width: size.width * 0.2,
  ),
  ),
  child,
  ],
  ),
  );
  }
  }
