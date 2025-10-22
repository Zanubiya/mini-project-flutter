import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Model/ProductModel.dart';

class Product2Repository{

  Future <List<ProductModel>>getProducts() async {
    var response = await http.get(Uri.parse("https://fakestoreapi.com/products?limit=2"));
    if (response.statusCode == 200) {
      var productData = jsonDecode(response.body);
      List<ProductModel>productlist=productData.map<ProductModel>((prd){
        return ProductModel.fromJson(prd);



      }).toList();
      return productlist;




    }
    return [];
  }

}