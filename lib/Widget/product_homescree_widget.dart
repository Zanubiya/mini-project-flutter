import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_flutter/Screen/product_screen.dart';
import 'package:mini_project_flutter/Widget/listview.dart';
import 'package:mini_project_flutter/Widget/navigation.dart';

import '../data.dart';

class ProductHomescreenWidget extends StatefulWidget {
  const ProductHomescreenWidget({super.key});

  @override
  State<ProductHomescreenWidget> createState() => _ProductHomescreenWidgetState();
}

class _ProductHomescreenWidgetState extends State<ProductHomescreenWidget> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
        body: Column(  // Remove Scaffold, just return Column
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image at top-right
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('asset/images/menu.png', width: 100, height: 100),
              Image.asset('asset/images/Rectangle 97.png')
            ],
          ),
        ),

        SizedBox(height: 10),

        // Welcome text below image
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            'Welcome!',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            'Our Fashion App',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
        SizedBox(height: 20),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 320,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "search",
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.black12,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Image.asset('asset/images/filtter.png')
            ],
          ),
        ),

        SizedBox(height: 20),

        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CarouselSlider(
            options: CarouselOptions(
              height: 250,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
            ),
            items: offers.map((offer) {
              return Builder(
                builder: (BuildContext context) {
                  return Stack(
                    children: [
                      // Background image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          offer['image']!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 200,
                        ),
                      ),
                      // Overlay container for text
                      Positioned(
                        top: 16,
                        left: 16,
                        right: 16,
                        child: Container(
                          padding: EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                offer['title']!,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                offer['description']!,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                offer['code']!,
                                style: TextStyle(
                                  color: Colors.black26,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 30),
                              TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.black,
                                ),
                                onPressed: () {},
                                child: Text(
                                  "Get Now",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            }).toList(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("New Arrivals",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductScreen()));
              }, child: Text("viewall",style: TextStyle(fontSize: 20),)),
            ],
          ),
        ),
    Expanded(
         // Give it a fixed height
          child: ProductListView(),
        ),

      ],
    )
    );
  }
}
