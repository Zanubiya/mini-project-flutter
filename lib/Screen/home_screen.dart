import 'package:flutter/material.dart';
import 'package:mini_project_flutter/Screen/login%20page.dart';
import 'package:mini_project_flutter/Widget/home_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    return HomeWidget();

    
  }

 
}
