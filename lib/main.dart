import 'package:avocacy/forgotPWPage.dart';
import 'package:avocacy/afterSignUpPage.dart';
import 'package:avocacy/articlesPage.dart';
import 'package:avocacy/favArticlesPage.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
//root of the widget tree
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

//materialApp provides the basis for an app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avocacy',
      theme: ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 209, 219, 193),
          
        ),
        home: LoginPage(),
      );
    
  }
}

//every widget needs to have one method in it.
//build method describes how to build this widget
class LoginPage extends StatefulWidget {
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

            Padding(
            padding: const EdgeInsets.only(top: 110.0)),

            Center(child: Text('Avocay',
            style: TextStyle(fontSize: 36,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic
            ))),

            Padding(
            padding: const EdgeInsets.only(top: 20.0)),

            Center(child: Text('We advocate women’s reproductive rights & justice',
            style: TextStyle(fontSize: 15,
            ))),

            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 40,
                    ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    hintText: ''),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
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
                      context, MaterialPageRoute(builder: (_) => ForgotPWPage()));
              },
              child: Text(
                'Forgot your password?',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),

            TextButton(
              onPressed: (){
                Navigator.push(
                      context, MaterialPageRoute(builder: (_) => SignUpPage()));
              },
              child: Text(
                'Do not have an account yet?',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10.0)),

            Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 89, 70, 14), borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => DashboardPage()));
                }, 
                child: Text(
                  'Login',
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

class SignUpPage extends StatefulWidget {
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

            Padding(
            padding: const EdgeInsets.only(top: 110.0)),

            Center(child: Text('Sign Up',
            style: TextStyle(fontSize: 36,
              fontWeight: FontWeight.bold,
            ))),

            Padding(
            padding: const EdgeInsets.only(top: 10.0)),

            Text('Why sign up?\nWe create a safe place for you\nby asking for your credential to access the app',
            style: TextStyle(fontSize:15,
            ), textAlign: TextAlign.center),

            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 20, bottom: 10),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your username',
                    hintText: 'Pick a username that cannot identify you'),
              ),
            ),
  
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 10, bottom: 10),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your password',
                    hintText: 'Password must be longer than 8 digits'),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
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
                      context, MaterialPageRoute(builder: (_) => AfterSignUpPage()));
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white, fontSize: 20),
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

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      bottomNavigationBar: GNav(
        gap: 10,
        tabBackgroundColor: Colors.white,
        tabs: [
          GButton(icon: Icons.search,
          text: 'articles',onPressed:() {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => RelatedArticlesPage()));
                }),
          GButton(icon: Icons.home,
          text: 'Home', onPressed:() {
            Navigator.push(
              context, MaterialPageRoute(builder: (_) => DashboardPage()));
          }),
          GButton(icon: Icons.settings,
          text: 'Settings')
        ],),

      backgroundColor: Color.fromARGB(255, 209, 219, 193),
      body: SingleChildScrollView(
        child: Column(
          
          children: <Widget>[

            Padding(
            padding: const EdgeInsets.only(top: 110.0)),

            Center(child: Text('Dashboard',
            style: TextStyle(fontSize: 36,
              fontWeight: FontWeight.bold,
            ))),

            Padding(
            padding: const EdgeInsets.only(top: 10.0)),

            Container(
              height: 150,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.lime),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => DashboardPage()));
                }, style: ElevatedButton.styleFrom(
                  primary: Colors.white
                 ),
                child: Text(
                  'Nearby Resources Bookmarks',
                  style: TextStyle(fontSize: 20, color: Colors.brown),
                ),
              ),
            ),

            Padding(
            padding: const EdgeInsets.only(top: 10.0)),

            Container(
              height: 150,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => FavArticlesPage()));
                }, style: ElevatedButton.styleFrom(
                  primary: Colors.white
                 ),
                child: Text(
                  'Related Articles Bookmarks',
                  style: TextStyle(fontSize: 20, color: Colors.brown),
                ),
              ),
            )
          ],
        ),
      ),
     );  
  }
}