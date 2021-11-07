// import 'dart:html';
import '../utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 80),
              SvgPicture.asset("assets/images/login_image.svg",
                  fit: BoxFit.cover, height: 200),
              SizedBox(height: 10),
              Text(
                "Welcome! " + name,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 40),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 30, right: 20),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 46,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: "Enter username",
                        labelText: "Username",
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "Enter password",
                        labelText: "Password",
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                        onTap: () async {
                          setState(() {
                            changeButton = true;
                          });
                          await Future.delayed(Duration(seconds: 1));
                          Navigator.pushNamed(context, MyRoutes.home);
                        },
                        child: AnimatedContainer(
                          // Create animated container with button
                          duration: Duration(seconds: 1),

                          width: changeButton ? 50 : 150,
                          height: 50,
                          // color: Colors.teal,
                          alignment: Alignment.center,
                          child: changeButton
                              ? (Icon(Icons.done, color: Colors.white))
                              : const Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                          // create border radius of container, to make it round  (circular)
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius:
                                BorderRadius.circular(changeButton ? 30 : 15),
                            // shape: changeButton
                            //     ? BoxShape.circle
                            //     : BoxShape.rectangle),
                          ),
                        )
                        // ElevatedButton(
                        //     child: const Text("Login"),
                        //     style: TextButton.styleFrom(
                        //       primary: Colors.white,
                        //       padding: const EdgeInsets.symmetric(
                        //           horizontal: 50, vertical: 20),
                        //     ),
                        //     onPressed: () {
                        //       // ignore: avoid_print
                        //       // print("logged in...");
                        //       Navigator.pushNamed(context, MyRoutes.home);
                        //     }),
                        ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
