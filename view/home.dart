import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:untitled1/view/login.dart';

import '../controller/data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Widget build(BuildContext context) {
    var cl = Get.put(DataController());
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              onTap: () {
                Get.to(Scaffold(
                  appBar: AppBar(title: Text("Developers")),
                  body: Center(
                    child: Text("ENG/ Shahd Shahban Mohamed"),
                  ),
                ));
              },
              title: Text("Developers"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                Get.to(Scaffold(
                  appBar: AppBar(title: Text("About app")),
                  body: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text("Ecommerce flutter App for ITI summer training createed by eng/Shahd Shahban Mohamed",style: TextStyle(fontSize: 30),),
                    ),
                  ),
                ));
              },
              title: Text("About app"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                signOut();
              },
              title: Row(
                children: [
                  Icon(
                    Icons.logout,
                    size: 20,
                  ),
                  Text(" LogOut "),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: FutureBuilder(
        future: cl.getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData && snapshot.data != null) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var item = snapshot.data![index];
                return Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image(
                        image: NetworkImage(item['images'][0]),
                        height: 100,
                      ),
                      Expanded(child: Text("${item['title']}")),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Text('');
          }
        },
      ),
    );
  }
  Future<void> signOut() async {
    await _auth.signOut();
    Navigator.pushReplacement(
        context,
        PageTransition(
            child:  const Login(),
            type: PageTransitionType.bottomToTop));

    print('User signed out');
  }
}

