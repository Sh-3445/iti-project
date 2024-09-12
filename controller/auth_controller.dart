import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../view/bottom_navigation.dart';


class AuthController extends GetxController {
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData()async{
    var uid= FirebaseAuth.instance.currentUser!.uid;
return   FirebaseFirestore.instance.collection('users').doc(uid).get();
  }
  void onLogin(String email, String password, BuildContext ctx) async {
    try {
      showLoading(ctx);
      var data = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (data.user != null) {
        closeLoading(ctx);
        Get.offAll(() => const BottomNavigationView());
      }
      closeLoading(ctx);
    } catch (e) {
      Get.snackbar("Error", e.toString());
      closeLoading(ctx);
    } }
    void onRegister(String name, String email, String age, String password,
        BuildContext ctx) async {
      try {
        showLoading(ctx);
        var data = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        if (data.user != null) {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(data.user!.uid)
              .set({
            'name': name,
            'email': email,
            'age': age,
          });
          closeLoading(ctx);
          Get.offAll(BottomNavigationView());
        }
        closeLoading(ctx);
      } catch (e) {
        closeLoading(ctx);
      }
    }

}

Future showLoading(BuildContext ctx) async {
  await showDialog(
    context: ctx,
    builder: (context) => const AlertDialog(
      content: Center(child: CircularProgressIndicator()),
    ),
  );
}

Future closeLoading(BuildContext ctx) async {
  Navigator.canPop(ctx);
}
