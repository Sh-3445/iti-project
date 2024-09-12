import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'login.dart';


class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    super.initState();
 Future.delayed(Duration(milliseconds: 500),() => Get.offAll(Login()),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Welcome..."),),
    );
  }
}
