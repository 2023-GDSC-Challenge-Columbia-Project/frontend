import 'package:avocacy/main.dart';
import 'package:flutter/material.dart';


class ForgotPWPage extends StatefulWidget {
  const ForgotPWPage({super.key});

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

            const Padding(
            padding: EdgeInsets.only(top: 110.0)),

            const Center(child: Text('Find Your Password',
            style: TextStyle(fontSize: 30,
              fontWeight: FontWeight.bold,
            ))),

            const Padding(
            padding: EdgeInsets.only(top: 20.0)),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your username',
                    hintText: ''),
              ),
            ),

            const Padding(
            padding: EdgeInsets.only(top: 20.0)),

            Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => const FindSecurityKeyPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown
                ),

                child: const Text(
                  'Next',
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

class FindSecurityKeyPage extends StatefulWidget {
  const FindSecurityKeyPage({super.key});

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

            const Padding(
            padding: EdgeInsets.only(top: 110.0)),

            const Center(child: Text('Enter your security key\n(you received it when you signed up)',
            style: TextStyle(fontSize: 25,
              fontWeight: FontWeight.bold), textAlign: TextAlign.center
            )),

            const Padding(
            padding: EdgeInsets.only(top: 20.0)),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your security key',
                    hintText: ''),
              ),
            ),

            const Padding(
            padding: EdgeInsets.only(top: 20.0)),

            Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => const MyHomePage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown
                ),

                child: const Text(
                  'Next',
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

 