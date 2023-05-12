import 'main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      var colorScheme = Theme.of(context).colorScheme;
      return SingleChildScrollView(
        child: Column(
          
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.only(top: 10.0)),

            Text("Clicks the texts if you want more info about sources we used: \n\n "),
            ListTile(
                          
                        
                          title: Text("Thanks to Avail NY that gladly approved using their data"
                            //pair.asLowerCase,
                            //semanticsLabel: pair.asPascalCase,
                          ),
                          onTap: () => launch("https://www.availnyc.org/")
                        ),
ListTile(
                          
                        
                          title: Text("https://www.womenshealth.gov/pregnancy/youre-pregnant-now-what/stages-pregnancy"
                            //pair.asLowerCase,
                            //semanticsLabel: pair.asPascalCase,
                          ),
                          onTap: () => launch("https://www.womenshealth.gov/pregnancy/youre-pregnant-now-what/stages-pregnancy")
                        ),

ListTile(
                          title: Text("ablocs.csv file in the repo"
                            //pair.asLowerCase,
                            //semanticsLabel: pair.asPascalCase,
                          ),
                          onTap: () => launch("https://github.com/aloverso/DataScience16CTW")
                        ),


            ],),);}}