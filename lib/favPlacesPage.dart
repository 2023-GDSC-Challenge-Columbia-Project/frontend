import 'main.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';


class FavPlacePage extends StatelessWidget {
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
          title: Text("Your favorite locations"),),

        

        body: Center(
        child: Text('No favorite locations yet.'),
      ),); 
    }

      return Scaffold(
        backgroundColor: theme.colorScheme.surfaceVariant,
        appBar: AppBar(
          title: Text("Favorite Nearby Resources Page"),),
        body: 
      
      Column( 
  
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(30),

          
          child: Text('You have '
              '${appState.favoritePlaces.length} favorite resources:'),
        ),
        Expanded(
          // Make better use of wide windows with a grid.
          child: 
          
            ListView(
            children: [
              for (var pair in appState.favoritePlaces)
                ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.delete_outline, semanticLabel: 'Delete'),
                    color: theme.colorScheme.primary,
                    onPressed: () {
                      appState.removeFavoritePlace(pair);
                    },
                  ),
                  title: Text(pair.infoWindow.title?? "Default")
                  ),
      ],),
            
          ),
        ],),
    
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