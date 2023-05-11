import 'forgotPWPage.dart';
import 'afterSignUpPage.dart';
import 'main.dart';
import 'package:flutter/material.dart';

//every widget needs to have one method in it.
//build method describes how to build this widget
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
         
          children: <Widget>[

            const Padding(
            padding: EdgeInsets.only(top: 110.0)),

            const Center(child: Text('Avocay',
            style: TextStyle(fontSize: 36,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic
            ))),

            const Padding(
            padding: EdgeInsets.only(top: 20.0)),

            const Center(child: Text('We advocate women’s reproductive rights & justice',
            style: TextStyle(fontSize: 15,
            ))),

            const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Center(
                child: SizedBox(
                    width: 200,
                    height: 40,
                    ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    hintText: ''),
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 20, bottom: 10),
            
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),

            TextButton(
              onPressed: (){
                 Navigator.push(
                      context, MaterialPageRoute(builder: (_) => const ForgotPWPage()));
              },
              child: const Text(
                'Forgot your password?',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),

            TextButton(
              onPressed: (){
                Navigator.push(
                      context, MaterialPageRoute(builder: (_) => const SignUpPage()));
              },
              child: const Text(
                'Do not have an account yet?',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(top: 10.0)),

            Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 89, 70, 14), borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => const MyHomePage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown
                ), 
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
      
          children: <Widget>[

            const Padding(
            padding: EdgeInsets.only(top: 110.0)),

            const Center(child: Text('Sign Up',
            style: TextStyle(fontSize: 36,
              fontWeight: FontWeight.bold,
            ))),

            const Padding(
            padding: EdgeInsets.only(top: 10.0)),

            const Text('Why sign up?\nWe create a safe place for you\nby asking for your credential to access the app',
            style: TextStyle(fontSize:15,
            ), textAlign: TextAlign.center),

            const Padding(
              padding: EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 20, bottom: 10),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your username',
                    hintText: 'Pick a username that cannot identify you'),
              ),
            ),
  
            const Padding(
              padding: EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 10, bottom: 10),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your password',
                    hintText: 'Password must be longer than 8 digits'),
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 10, bottom: 10),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Re-Enter your password',
                    hintText: ''),
              ),
            ),

            Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.lime, borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => const AfterSignUpPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown
                  ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )                  
                ),
              ),
          ],
         ),
      ),
    ); 
  }
}