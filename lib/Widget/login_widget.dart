import 'package:flutter/material.dart';
import 'package:mini_project_flutter/Screen/product_home_acreen.dart';
import 'package:mini_project_flutter/Screen/product_screen.dart';
import 'package:mini_project_flutter/Widget/navigation.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late TextEditingController _usernameController,_passwordController;

  @override
  void initState() {
   _usernameController=TextEditingController();
     _passwordController=TextEditingController();
  }

  String? emailError;
  String? passwordError;

  void validateFields() {
    setState(() {
      emailError = null;
      passwordError = null;

      // Email validation
      if (_usernameController.text.isEmpty) {
        emailError = 'Please enter your email';
      } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
          .hasMatch(_usernameController.text)) {
        emailError = 'Invalid email format';
      }

      // Password validation
      if (_passwordController.text.isEmpty) {
        passwordError = 'Please enter your password';
      } else if (_passwordController.text.length < 6) {
        passwordError = 'Password must be at least 6 characters';
      }
    });

    // If all fields are valid
    if (emailError == null && passwordError == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Login Successful!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
            children: [
              Column(

                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,                ),

                  Center(child: Text("Lush & Lace",style: TextStyle(fontFamily: "BrittanySignature",
                      fontSize: 20,fontWeight: FontWeight.bold),)
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Welcome!",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("please login or signup to continue our app",style: TextStyle(fontSize: 15,color: Colors.grey,fontWeight: FontWeight.bold ),

                        ),
                      )


                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            SizedBox(
                                width:380,
                                child:
                                TextField(

                                  controller: _usernameController,
                                    decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                                        labelText: "Email",
                                      errorText: emailError,
                                    )


                                ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                                width:380,
                                child:
                                TextField(
                                  controller: _passwordController,
                                    obscureText: true,
                                    decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                                        labelText: "Password",
                                      errorText: passwordError,
                                    )

                                )
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            SizedBox(
                              width:380,
                              child:
                              TextButton(style: TextButton.styleFrom(backgroundColor: Colors.black),onPressed: (){
                                validateFields();

                                Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavBar())
                                );
                              }, child:Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20))
                              ),

                            )
                          ]
                          ,

                        )
                    ),
                  )







                ],

              ),
            ]
        )

    );
  }
}
