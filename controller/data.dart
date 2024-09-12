import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  Future<List> getData() async {
    var data = await Dio().get('https://dummyjson.com/products');
    if (data.statusCode == 200) {
      return data.data['products'];
    } else {
      return [];
    }
  }

  Future<List> getCategory() async {
    var data = await Dio().get('https://dummyjson.com/products/category-list');
    if (data.statusCode == 200) {
      return data.data;
    } else {
      return [];
    }
  }


  Future<List> getCategoryData(String category) async {
    var data = await Dio().get('https://dummyjson.com/products');
    if (data.statusCode == 200) {
      List products = data.data['products'];
      List filteredProducts = products.where((product) => product['category'] == category).toList();
      return filteredProducts ;
    } else {
      return [];
    }
  }
}
