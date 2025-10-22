import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_flutter/Repository/product2_repository.dart';

import '../Model/ProductModel.dart';
import '../Repository/star_rating.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({super.key});

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  List<ProductModel> products=[];
  Product2Repository product2repository=Product2Repository();

  loadproducts() async {
    var productdata = await this.product2repository.getProducts();
    setState(() {
      this.products = productdata;
    });
  }
    _ProductListViewState() {
      this.loadproducts();
    }

  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
        shrinkWrap: true,
        physics:AlwaysScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        childAspectRatio: 3/4,
                        mainAxisSpacing: 5),
                    itemCount:products.length,
                    itemBuilder: (context,index){

                      var product=this.products[index];
                      return Card(

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Image.network(product.image,height:100),
                            Text(product.title),
                            StarRating(product.rating.rate),

                            ElevatedButton(onPressed: (){
                            }, child: Text('Add to cart')


                            ),


                            // Text(this.message),

                          ],
                        ),


                      );



                    }




                );

  }
}
