import 'package:flutter/material.dart';
import 'package:mini_project_flutter/Screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context)=>HomeScreen()),);
      
      
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Container(
                width: double.infinity,
                height: double.infinity,
              decoration: BoxDecoration(
                image:DecorationImage(
                  image:AssetImage('asset/images/Untitled design (24).png'),
              fit:BoxFit.cover,
              )
              ),
            
            ),

        ),

      );


  }


}
