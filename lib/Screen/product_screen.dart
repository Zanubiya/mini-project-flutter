import 'package:flutter/material.dart';

import '../Widget/product_grid_data.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          title: Text("Products")
      ),
      body:



          ProductdataGrid(),


      );


  }
}
