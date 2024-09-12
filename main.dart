import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:untitled1/view/login.dart';


import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: AnimatedSplashScreen(
          backgroundColor: Color(0xfff1e1c7),
          duration: 4000,
          splash: Image.asset("assets/splash.jpg",fit: BoxFit.contain,width: double.infinity),
          nextScreen: Login(),
          splashIconSize: double.infinity,
          splashTransition: SplashTransition.fadeTransition,
        ),
      ),
    );
  }
}
