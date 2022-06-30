import 'package:devshowcase/screens/authentication/landingpage.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: LandingPage(),
      duration: 500,
      imageSize: 200,
      imageSrc: "images/splash_logo.png",
      text: "DevShowCase",
      textType: TextType.ColorizeAnimationText,
      textStyle: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w800),
      colors: const [
        Colors.white,
        Colors.yellow,
        Colors.white,
        Colors.yellow,
        Colors.white,
        Colors.yellow,
        Colors.white,
        Colors.yellow,
      ],
      backgroundColor: Colors.black,
    );
  }
}
