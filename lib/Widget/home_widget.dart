import 'package:flutter/material.dart';
import 'package:mini_project_flutter/Screen/login%20page.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:Stack(
            children: [
              Stack(
                children: [
                Image.asset(
                  'asset/images/Untitled design (25).png',
                  width: MediaQuery.of(context).size.width.toDouble(),
                  height: MediaQuery.of(context).size.height.toDouble(),
                  fit: BoxFit.cover,
                  cacheWidth: 800, // reduce memory usage
                ),
                 Column(

                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 620),
                   Align(
                     alignment: Alignment.bottomCenter,
                     child: TextButton(style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 90, vertical: 20),
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),

                    ),onPressed: (){

                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()),);


                    }, child: Text("Login",style:TextStyle(color: Colors.white,fontSize: 20),)
                    ),
                   ),
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),

                    ),onPressed: (){}, child: Text("Register",style:TextStyle(color: Colors.white,fontSize: 20),)
                    ),

                  ],
                ),
              ]
              ),
            ]
        )

    );

  }
}
