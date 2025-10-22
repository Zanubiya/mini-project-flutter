import 'package:flutter/material.dart';
import 'package:mini_project_flutter/Widget/navigation.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return  Row(children: [
      BottomNavBar()
    ]
    );

  }
}
