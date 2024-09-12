import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/data.dart';
import 'category_products.dart';


class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(),
      body: FutureBuilder(future: DataController().getCategory(), builder: (context, snapshot) {
    if(snapshot.connectionState==ConnectionState.waiting){
    return const Center(child: CircularProgressIndicator(),);
    }
    else if(snapshot.hasData&&snapshot.data!=null) {
      return ListView.builder(
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
        var item=snapshot.data![index];
        return ListTile(
          title: Text(item),
        onTap: () {
            Get.to(CategoryProducts(category: item));

        },
        );
      },);
    }
    return const SizedBox();

    },),
    );
  }
}
