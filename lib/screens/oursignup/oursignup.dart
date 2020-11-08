import 'package:flutter/material.dart';
import 'package:marketplace/screens/oursignup/oursignupform.dart';


class Oursignup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        Expanded(
          child: ListView(
            padding: EdgeInsets.all(20),
            children: <Widget> [
              Padding(padding:
              EdgeInsets.all(30.0),
              child: Image.asset("assets/maroo.png"),

              ),

              SizedBox(height: 20.0,),

              OursignupForm(),

            ],
          ),
        )
      ],
    )
      
    );
  }
}