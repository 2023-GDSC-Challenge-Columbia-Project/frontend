import 'package:avocacy/main.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class FavArticlesPage extends StatefulWidget {
  @override

  _FavArticlesPageState createState() => _FavArticlesPageState();
}

class _FavArticlesPageState extends State<FavArticlesPage> {

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      bottomNavigationBar: GNav(
        gap: 10,
        tabBackgroundColor: Colors.lime,
        tabs: [
          GButton(icon: Icons.home,
          text: 'Home', onPressed:() {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => DashboardPage()));
                },),
          GButton(icon: Icons.settings,
          text: 'Settings')
        ],),

        body: ListView(
          children:[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                color: Colors.green[200],
                child: Text('article 1', style:TextStyle(fontSize: 20))
              )
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                color: Colors.green[200],
              )
            )
          ]
        )
      );
  }
}