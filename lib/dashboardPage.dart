import 'main.dart';
import 'favArticlesPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      var colorScheme = Theme.of(context).colorScheme;
      return SingleChildScrollView(
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
              //height: 150,
              //width: 400,
              // decoration: BoxDecoration(
              //     color: Colors.lime),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => MyHomePage()));
                }, style: ElevatedButton.styleFrom(
                    fixedSize: Size(400, 150),                    
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.all(20.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                child: Text(
                  'Nearby Resources Bookmarks',
                  style: TextStyle(fontSize: 20, color: Colors.brown),
                ),
              ),
            ),

            Padding(
            padding: const EdgeInsets.only(top: 10.0)),

            Container(
              // height: 150,
              // width: 400,
              // decoration: BoxDecoration(
              //     color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => FavArticlesPage()));
                }, style: ElevatedButton.styleFrom(
                    fixedSize: Size(400, 150),                    
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.all(20.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                child: Text(
                  'Related Articles Bookmarks',
                  style: TextStyle(fontSize: 20, color: Colors.brown),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
