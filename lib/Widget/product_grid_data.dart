import 'package:flutter/material.dart';

import '../Model/ProductModel.dart';
import '../Repository/product_repository.dart';
import '../Repository/star_rating.dart';

class ProductdataGrid extends StatefulWidget {
ProductdataGrid({super.key});


@override
State<ProductdataGrid> createState() => _ProductdataGridState();
}

class _ProductdataGridState extends State<ProductdataGrid> {
  List<ProductModel> products=[];
  ProductRepository productrepository=ProductRepository();
  var message ='';
  double price =0.0;
  loadproducts() async {
    var productdata=await this.productrepository.getProducts();
    setState(() {
      this.products=productdata;
    });


  }
  _ProductdataGridState(){
    this.loadproducts();

  }

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Column(
      children: [
        Text(this.message),
        Text('price:${this.price}'),
        Expanded(
            child: GridView.builder(
                physics: AlwaysScrollableScrollPhysics(),
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
                          setState(() {
                            this.message='${product.title} added to cart successfully';
                            this.price=product.price;


                          });


                          // print('added');

                        }, child: Text('Add to cart')


                        ),


                        // Text(this.message),

                      ],
                    ),


                  );



                }




            )

        ),
      ],
    )
    );
  }
}

