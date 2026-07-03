import 'package:flutter/material.dart';
import 'package:mini_project_flutter/Screen/home_screen.dart';
import 'package:mini_project_flutter/Screen/product_screen.dart';
import 'package:mini_project_flutter/Widget/product_homescree_widget.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentVariable=0;
  var hometabs=[
    ProductHomescreenWidget(),
    ProductScreen(),
    // trigger github action
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    bottomNavigationBar: NavigationBar(

    onDestinationSelected: (int index){
      setState(() {
        currentVariable=index;
      });

    },

    indicatorColor: Colors.black,
    selectedIndex: currentVariable
    ,destinations: [NavigationDestination(icon: Icon(Icons.home),selectedIcon:Icon(Icons.home,color: Colors.white,) , label: "Home"),
    NavigationDestination(icon: Icon(Icons.add_box),selectedIcon:Icon(Icons.add_box,color: Colors.white,) , label: "Products")]),
    body: hometabs[currentVariable],


    );
  }
}
