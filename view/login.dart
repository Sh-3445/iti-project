import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:untitled1/view/register.dart';

import '../controller/auth_controller.dart';
import 'bottom_navigation.dart';
import 'home.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool sec = true;

  var visible = const Icon(Icons.visibility, color: Color(0xff4c5166));

  var visibleoff = const Icon(Icons.visibility_off, color: Color(0xff4c5166));
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return BottomNavigationView();
            } else {
              return Form(
                key: formKey,
                child: ListView(
                  padding: const EdgeInsets.all(10),
                  children: [
                    Container(
                        height: 350,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Image.asset(
                            'assets/login.png',
                            fit: BoxFit.cover,
                          ),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    // Email Field
                    TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          border: OutlineInputBorder(),
                          hintText: "Email",
                          prefixIcon: Icon(
                            Icons.email,
                            color: Color(0xff4c5166),
                          ),
                        )),
                    const SizedBox(height: 10),
                    // Password Field
                    TextFormField(
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        obscureText: sec,
                        decoration:  InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Password",
                          prefixIcon: Icon(
                            Icons.password,
                            color: Color(0xff4c5166),
                          ),
                          suffix: IconButton(
                              onPressed: () {
                                setState(() {
                                  sec = !sec;
                                });
                              },
                              icon: sec ? visible : visibleoff),
                        )),
                    const SizedBox(height: 10),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {
                            Get.to(Register());
                          },
                          child: Text("Register new account"),
                        )),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Get.put(AuthController()).onLogin(emailController.text,
                                passwordController.text, context);
                          }
                        },
                        child: Text("Login"))
                  ],
                ),
              ) ;
            }
          },
        ),
      ),
    );
  }
}
