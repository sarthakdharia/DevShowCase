import 'dart:html';

import 'package:devshowcase/screens/authentication/login_screen.dart';
import 'package:devshowcase/screens/authentication/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:swipe/swipe.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  String _message = 'Swipe your screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Swipe(
            verticalMaxWidthThreshold: 150,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/lp.png'), fit: BoxFit.cover)),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Image.asset('images/splash_logo.png'),
              ),
            ),
            onSwipeUp: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            onSwipeDown: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
