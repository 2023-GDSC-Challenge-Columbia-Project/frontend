import 'main.dart';
import 'favArticlesPage.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

    @override
    Widget build(BuildContext context) {
      var colorScheme = Theme.of(context).colorScheme;
      return SingleChildScrollView(
        child: Column(
          
          children: <Widget>[

            const Padding(
            padding: EdgeInsets.only(top: 110.0)),

            const Center(child: Text('Dashboard',
            style: TextStyle(fontSize: 36,
              fontWeight: FontWeight.bold,
            ))),

            const Padding(
            padding: EdgeInsets.only(top: 10.0)),

            Container(
              height: 150,
              width: 400,
              decoration: const BoxDecoration(
                  color: Colors.lime),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => const MyHomePage()));
                }, style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white
                 ),
                child: const Text(
                  'Your Favorite Nearby Resources',
                  style: TextStyle(fontSize: 20, color: Colors.brown),
                ),
              ),
            ),

            const Padding(
            padding: EdgeInsets.only(top: 10.0)),

            Container(
              height: 150,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => const FavArticlesPage()));
                }, style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white
                 ),
                child: const Text(
                  'Your Favorite Articles',
                  style: TextStyle(fontSize: 20, color: Colors.brown),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
