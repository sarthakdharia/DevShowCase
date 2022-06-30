import 'package:devshowcase/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devshowcase/screens/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DSC',
      theme: Themes.dark,
      darkTheme: Themes.dark,
      home: SplashScreen(),
    );
  }
}
