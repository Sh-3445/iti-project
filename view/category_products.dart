import 'package:flutter/material.dart';

import '../controller/data.dart';

class CategoryProducts extends StatelessWidget {
  const CategoryProducts({super.key,required this.category});
final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text(category)),
      body: FutureBuilder(future: DataController().getCategoryData(category), builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator(),);
        }
        else if(snapshot.hasData&&snapshot.data!=null) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var item=snapshot.data![index];
              return Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image(image: NetworkImage(item['images'][0]),height: 150,),
                    Text("${item['title']}"),
                  ],
                ),
              )   ;

            },);
        }
        return const SizedBox();

      },),
    );
  }
}
