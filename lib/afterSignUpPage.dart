import 'package:flutter/material.dart';

class AfterSignUpPage extends StatefulWidget {
  const AfterSignUpPage({super.key});

  @override
  _AfterSignUpPageState createState() => _AfterSignUpPageState();
}

class _AfterSignUpPageState extends State<AfterSignUpPage>{
  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body: SingleChildScrollView(
         child: Column(
         
          children: <Widget>[

            Padding(
            padding: EdgeInsets.only(top: 110.0)),

            Center(child: Text('Security Key Generated',
            style: TextStyle(fontSize: 30,
              fontWeight: FontWeight.bold
            ))),      
        ]
       )
      )
    );
   }
  }