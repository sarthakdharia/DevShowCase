import 'package:devshowcase/controllers/authcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register extends GetWidget<AuthController> {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final AuthController _auth = AuthController();
    final TextEditingController orgnameController = TextEditingController();
    final TextEditingController lastnameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();
    final GlobalKey<FormState> form = GlobalKey<FormState>();

    bool validate(String firstName, String lastName, String email,
        String password, String conPassword) {
      return false;
    }

    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: true,
            backgroundColor: const Color.fromARGB(255, 0, 7, 12),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Get.back(),
            )),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 0, 7, 12),
                  Color.fromARGB(255, 7, 39, 99),
                ],
              )),
            ),
            Positioned(
              top: 40,
              left: 30,
              right: 30,
              child: Form(
                key: form,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Register With Your details",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Segoe',
                        fontSize: 35,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF78D6FF),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 400,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: "Organization Name",
                            icon: Icon(Icons.person),
                            labelText: "Organization Name"),
                        controller: orgnameController,
                        validator: (val) {
                          if (val != null && val.isEmpty) {
                            return "Organization Name can't be Empty";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 400,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: "User Name",
                            icon: Icon(Icons.person),
                            labelText: "User Name"),
                        controller: lastnameController,
                        validator: (val) {
                          if (val != null && val.isEmpty) {
                            return "User Name can't be Empty";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 400,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: "Email",
                            icon: Icon(Icons.email),
                            labelText: "Email"),
                        controller: emailController,
                        validator: (val) {
                          if (val != null &&
                              val.isEmpty &&
                              !val.contains("@")) {
                            return "Enter a Valid Eamil Address";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 400,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: "Password",
                            icon: Icon(Icons.password),
                            labelText: "Password"),
                        controller: passwordController,
                        obscureText: true,
                        validator: (val) {
                          if (val != null && val.isEmpty) {
                            return "Please Enter a Password";
                          } else if (val != null && val.length < 8) {
                            return "Password must be atleast 8 characters long";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 400,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: "Confirm Password",
                            icon: Icon(Icons.password),
                            labelText: "Confirm Password"),
                        controller: confirmPasswordController,
                        obscureText: true,
                        validator: (val) {
                          if (val != null && val.isEmpty) {
                            return "Please Re-Enter New Password";
                          } else if (val != null && val.length < 8) {
                            return "Password must be atleast 8 characters long";
                          } else if (val != passwordController.text) {
                            return "Password must be same as above";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 5),
                                shape: const StadiumBorder(
                                  side: BorderSide(
                                    width: 3,
                                    color: Color(0xFF78D6FF),
                                  ),
                                ),
                                primary: const Color.fromARGB(0, 120, 215, 255),
                              ),
                              child: const Text(
                                "Log In",
                                style: TextStyle(
                                  fontFamily: 'Segoe',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF78D6FF),
                                ),
                              ),
                              onPressed: () {
                                Get.back();
                              },
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 5),
                                shape: const StadiumBorder(
                                  side: BorderSide(
                                    width: 3,
                                    color: Color(0xFF78D6FF),
                                  ),
                                ),
                                primary: const Color.fromARGB(0, 120, 215, 255),
                              ),
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontFamily: 'Segoe',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF78D6FF),
                                ),
                              ),
                              onPressed: () {
                                if (form.currentState!.validate()) {
                                  controller.register(emailController.text,
                                      passwordController.text);
                                }
                              },
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
