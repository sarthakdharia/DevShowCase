import 'package:devshowcase/screens/authentication/login_screen.dart';
import 'package:devshowcase/screens/authentication/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:swipe/swipe.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/lp.png'), fit: BoxFit.cover)),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Center(
              child: Image.asset('images/splash_logo.png'),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              IconButton(
                  onPressed: () {
                    Get.to(() => Login());
                  },
                  icon: Icon(
                    Icons.login,
                    color: Theme.of(context).primaryColor,
                  )),
              IconButton(
                  onPressed: () {
                    Get.to(() => Register());
                  },
                  icon: Icon(
                    Icons.app_registration_rounded,
                    color: Theme.of(context).primaryColor,
                  ))
            ])
          ])),
    );
  }
}
