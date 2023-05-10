import 'main.dart';
import 'favArticlesPage.dart';
import 'package:flutter/material.dart';
//import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart'; //for watch MyAppState
import 'package:url_launcher/url_launcher.dart';

class RelatedArticlesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var appState = context.watch<MyAppState>();
    int pw = appState.pregnancy_week;
    IconData icon;
    IconData? _getIcon (link){
    if (appState.favorites.contains(link)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }
    return icon;}
   

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
   

    return MaterialApp(
      home: DefaultTabController(
        length: 4,
    child: Scaffold(
      backgroundColor: colorScheme.surfaceVariant,
      appBar: AppBar(
        bottom: const TabBar(tabs: [
          Tab(icon: Icon(Icons.safety_check)),
          Tab(icon: Icon(Icons.safety_check)),
          Tab(icon: Icon(Icons.safety_check)),
          Tab(icon: Icon(Icons.safety_check)),
        ],
        ),
        title: Text("Search for your information!"),
        leading: Icon(Icons.book),
        actions: <Widget>[
          IconButton(
            onPressed: () {Navigator.push(
                    context, MaterialPageRoute(builder: (_) => FavArticlesPage()));}, 
            icon: const Icon(Icons.arrow_forward),
            tooltip: "Open favorite articles page"),
          IconButton(
            onPressed: () {Navigator.push(
                    context, MaterialPageRoute(builder: (_) => FavArticlesPage()));}, 
            icon: const Icon(Icons.arrow_forward),
            tooltip: "Open favorite articles page")
        ],
        
      ),
      
      body: TabBarView(
      children:[
    
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                
            Expanded(
              // Make better use of wide windows with a grid.
              child:           
                ListView(
                  children: [
                    for (var link in appState.abortionLinks)             
                    
                      ListTile(
                        leading: IconButton(
                          icon: Icon(_getIcon(link), semanticLabel: 'Bookmark'),
                          color: colorScheme.primary,
                          onPressed: () {
                            appState.toggleFavorite(link);
                          },
                        ) ,
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
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                
            Expanded(
              // Make better use of wide windows with a grid.
              child:           
                ListView(
                  children: [
                    for (var link in appState.pregnancyLinks)             
                    
                      ListTile(
                        leading: IconButton(
                          icon: Icon(_getIcon(link), semanticLabel: 'Bookmark'),
                          color: colorScheme.primary,
                          onPressed: () {
                            appState.toggleFavorite(link);
                          },
                        ) ,
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
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                
            Expanded(
              // Make better use of wide windows with a grid.
              child:           
                ListView(
                  children: [
                    for (var link in appState.decisionLinks)             
                    
                      ListTile(
                        leading: IconButton(
                          icon: Icon(_getIcon(link), semanticLabel: 'Bookmark'),
                          color: colorScheme.primary,
                          onPressed: () {
                            appState.toggleFavorite(link);
                          },
                        ) ,
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
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                
            Expanded(
              // Make better use of wide windows with a grid.
              child:           
                ListView(
                  children: [
                    for (var link in appState.afterAbortionLinks)             
                    
                      ListTile(
                        leading: IconButton(
                          icon: Icon(_getIcon(link), semanticLabel: 'Bookmark'),
                          color: colorScheme.primary,
                          onPressed: () {
                            appState.toggleFavorite(link);
                          },
                        ) ,
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

    ],),
    ),),); 
  }
}

/*class RelatedArticlesPage extends StatefulWidget {
  @override
  _RelatedArticlesPageState createState() => _RelatedArticlesPageState();
}

class _RelatedArticlesPageState extends State<RelatedArticlesPage> {

final Uri _url = Uri.parse('https://flutter.dev');

  @override
  Widget build(BuildContext context) {
    
     return Scaffold(
      
        body: SingleChildScrollView(
        child: Column(
          
          children: <Widget>
          
          [

            Padding(
            padding: const EdgeInsets.only(top: 40.0)),

            Container(
              height: 40,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.lime, borderRadius: BorderRadius.circular(5)),
            
                child: InkWell(
                  child: Text ('8 Pregnancy Questions to Ask When Unexpectedly Pregnant', 
                  textAlign: TextAlign.center, style:TextStyle(fontSize: 15)),
                  onTap:() => launch('https://www.availnyc.org/8-questions-unexpected-pregnancy')
                )
              ),

            Padding(
            padding: const EdgeInsets.only(top: 20.0)),

              Container(
              height: 40,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.lime, borderRadius: BorderRadius.circular(5)),
            
                child: InkWell(
                  child: Text ('8 Tips to Process an Accidental Pragnency', 
                  textAlign: TextAlign.center, style:TextStyle(fontSize: 15)),
                  onTap:() => launch('https://www.availnyc.org/8-tips-to-process-an-accidental-pregnancy')
                )
              ),
            

          ]

        )
        )
      );
    }

    Future<void> _launchUrl() async {
     if (!await launchUrl(_url)) {
     throw Exception('Could not launch $_url');
     }
   }


   use Tile List and Favorite button 
  }
  */
