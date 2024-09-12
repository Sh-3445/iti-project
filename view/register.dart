import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import '../controller/auth_controller.dart';


class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
    TextEditingController nameController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
    bool secp = true;

    var visiblep = const Icon(Icons.visibility, color: Color(0xff4c5166));

    var visibleoffp = const Icon(Icons.visibility_off, color: Color(0xff4c5166));
  @override
  Widget build(BuildContext context) {
        return Scaffold(
      body: Form(
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
                    'assets/signup.png',
                    fit: BoxFit.cover,
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            // Name Field
            TextFormField(
                controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },       decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Name",
                )),
            const SizedBox(height: 10),
               // Age Field
            TextFormField(
                controller: ageController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },     keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Age",
                )),
            const SizedBox(height: 10),
               // Email Field
            TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },  controller: emailController,
                decoration: const InputDecoration(
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
                obscureText: secp,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: const Icon(
                    Icons.password,
                    color: Color(0xff4c5166),
                  ),
                  suffix: IconButton(
                      onPressed: () {
                        setState(() {
                          secp = !secp;
                        });
                      },
                      icon: secp ? visiblep : visibleoffp),
                  hintText: "Password",
                )),

            const SizedBox(height: 20),
            ElevatedButton(onPressed: (){
              if(formKey.currentState!.validate()) {
                Get.put(AuthController()).onRegister(
                    nameController.text, emailController.text, ageController.text, passwordController.text, context);
              }
            }, child: Text("Register"))

          ],
        ),
      ),
    );

  }
}