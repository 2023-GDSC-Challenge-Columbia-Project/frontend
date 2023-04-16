import 'package:avocacy/afterSignUpPage.dart';
import 'package:avocacy/articlesPage.dart';
import 'package:avocacy/favArticlesPage.dart';
import 'package:avocacy/main.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class ForgotPWPage extends StatefulWidget {
  @override
  _ForgotPWPageState createState() => _ForgotPWPageState();
}

class _ForgotPWPageState extends State<ForgotPWPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
         
          children: <Widget>[

            Padding(
            padding: const EdgeInsets.only(top: 110.0)),

            Center(child: Text('Find Your Password',
            style: TextStyle(fontSize: 30,
              fontWeight: FontWeight.bold,
            ))),

            Padding(
            padding: const EdgeInsets.only(top: 20.0)),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your username',
                    hintText: ''),
              ),
            ),

            Padding(
            padding: const EdgeInsets.only(top: 20.0)),

            Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => FindSecurityKeyPage()));
                },

                child: Text(
                  'Next',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.brown
                )
                  
                ),
              ),
          ],
         ),
      ),
    ); 
  }
}

class FindSecurityKeyPage extends StatefulWidget {
  @override
  _FindSecurityKeyPageState createState() => _FindSecurityKeyPageState();
}

class _FindSecurityKeyPageState extends State<FindSecurityKeyPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
         
          children: <Widget>[

            Padding(
            padding: const EdgeInsets.only(top: 110.0)),

            Center(child: Text('Enter your security key\n(you received it when you signed up)',
            style: TextStyle(fontSize: 25,
              fontWeight: FontWeight.bold), textAlign: TextAlign.center
            )),

            Padding(
            padding: const EdgeInsets.only(top: 20.0)),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your security key',
                    hintText: ''),
              ),
            ),

            Padding(
            padding: const EdgeInsets.only(top: 20.0)),

            Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => MyHomePage()));
                },

                child: Text(
                  'Next',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.brown
                )
                  
                ),
              ),
          ],
         ),
      ),
    ); 
  }
}

 