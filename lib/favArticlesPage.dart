import 'package:url_launcher/url_launcher.dart';

import 'main.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';


class FavArticlesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appState = context.watch<MyAppState>();
    var mainArea = ColoredBox(
      color: theme.colorScheme.surfaceVariant,);
    
    if (appState.favorites.isEmpty) {
      return Scaffold(
        backgroundColor: theme.colorScheme.surfaceVariant,
        appBar: AppBar(
          title: Text("Search for your information!"),),

        

        body: Center(
        child: Text('No favorites yet.'),
      ),); 
    }
String capitalize(String value) {
    var result = value[0].toUpperCase();
    bool cap = true;

    for (int i = 1; i < value.length; i++) {
      if (value[i - 1] == "n" && value[i] == "y") {
        result = result + value[i].toUpperCase();
      }
      else if (value[i - 1] == "y" && value[i] == "c"){
        result = result + value[i].toUpperCase();
      }
      else if (value[i - 1] == " " && value[i] == "i") {
        result = result + value[i].toUpperCase();
      }
      else if (value[i - 1] == "i" && value[i] == "m"){
        result = result + "'" + value[i];
      } 
      else if (value[i - 1] == " " && value[i] == "v"){
        result = result + "'" + value[i];
      }
      else if (value[i - 1] == " "){
        result = result + value[i].toUpperCase();
      }
      else {
            result = result + value[i];
            cap = false;
      }
    }
    return result;
  }
      return Scaffold(
        backgroundColor: theme.colorScheme.surfaceVariant,
        appBar: AppBar(
          title: Text("Favorite Articles Page"),),
        body: 
      
      Column( 
  
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(30),

          
          child: Text('You have '
              '${appState.favorites.length} favorites:'),
        ),
        Expanded(
          // Make better use of wide windows with a grid.
          child: 
          
            ListView(
            children: [
              for (var link in appState.favorites)
                ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.delete_outline, semanticLabel: 'Delete'),
                    color: theme.colorScheme.primary,
                    onPressed: () {
                      appState.removeFavorite(link);
                    },
                  ),
                  title: Text(
                    capitalize(link.split('/').last.replaceAll('-', ' '))
                    //pair.asLowerCase,
                    //semanticsLabel: pair.asPascalCase,
                  ),
                  onTap: () => launch("$link")
                ),
            ],
          ),
        ),
      ],
      ),
    );
  }
}

    
    


    


/*
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
                      context, MaterialPageRoute(builder: (_) => MyHomePage()));
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
*/
