import 'dart:convert';

import '../Model/ProductModel.dart';
import 'package:http/http.dart' as http;

class ProductRepository{
  Future <List<ProductModel>>getProducts() async {
    var response = await http.get(Uri.parse("https://fakestoreapi.com/products"));
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