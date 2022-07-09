import 'package:devshowcase/wrapper/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devshowcase/screens/authentication/landingpage.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  FirebaseAuth auth = FirebaseAuth.instance;
  late Rx<User?> _firebaseUser;

  User? get user => _firebaseUser.value;

  @override
  void onReady() {
    super.onReady();
    _firebaseUser = Rx<User?>(auth.currentUser);
    _firebaseUser.bindStream(auth.userChanges());
    ever(_firebaseUser, _initialScreens);
  }

  _initialScreens(User? user) {
    if (user == null) {
      print('Login Page');
      Get.offAll(() => LandingPage());
    } else {
      Get.offAll(() => Wrapper());
    }
  }

  void register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar("About User", "User Message",
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "About Creation Failed",
            style: TextStyle(color: Colors.blue),
          ),
          messageText: Text(
            e.toString(),
            style: TextStyle(color: Colors.blue),
          ));
    }
  }

  void login(String email, password) async {
    try {
      print("inside login ${email} + ${password}");
      UserCredential user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar("About Login", "User Message",
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "About Login Failed",
            style: TextStyle(color: Colors.blue),
          ),
          messageText: Text(
            e.toString(),
            style: TextStyle(color: Colors.blue),
          ));
    }
  }

  void logout() async {
    await auth.signOut();
  }
}
