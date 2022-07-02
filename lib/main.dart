import 'package:devshowcase/controllers/authcontroller.dart';
import 'package:devshowcase/custom_theme.dart';
import 'package:devshowcase/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devshowcase/screens/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthController(), permanent: true));
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
