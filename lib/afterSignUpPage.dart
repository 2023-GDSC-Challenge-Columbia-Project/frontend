import 'package:avocacy/articles.dart';
import 'package:avocacy/articlesBook.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class AfterSignUpPage extends StatefulWidget {
  @override
  _AfterSignUpPageState createState() => _AfterSignUpPageState();
}

class _AfterSignUpPageState extends State<AfterSignUpPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
         child: Column(
         
          children: <Widget>[

            Padding(
            padding: const EdgeInsets.only(top: 110.0)),

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