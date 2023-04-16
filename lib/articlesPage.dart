import 'package:avocacy/main.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

//import 'package:url_launcher/url_launcher.dart';

class RelatedArticlesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var appState = context.watch<MyAppState>();
    IconData icon;

    
    
    return Scaffold(
        backgroundColor: colorScheme.surfaceVariant,

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
        
        body: 
      
      Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(30),
          child: Text('Search for your information!'),
        ),
        Expanded(
          // Make better use of wide windows with a grid.
          child: 
          
            ListView(
            children: [
              for (var link in appState.allLinks)
                
                
                ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.favorite, semanticLabel: 'Bookmark'),
                    color: colorScheme.primary,
                    onPressed: () {
                      appState.toggleFavorite(link);
                    },
                ) ,
                  title: Text(
                    link
                    //pair.asLowerCase,
                    //semanticsLabel: pair.asPascalCase,
                  ),
                ),
            ],
          ),
        ),
      ],
      ),
    ); 
  }
}

/*class RelatedArticlesPage extends StatefulWidget {
  @override
  _RelatedArticlesPageState createState() => _RelatedArticlesPageState();
}

class _RelatedArticlesPageState extends State<RelatedArticlesPage> {

//final Uri _url = Uri.parse('https://flutter.dev');

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
                  //onTap:() => launch('https://www.availnyc.org/8-questions-unexpected-pregnancy')
                )
              ),

            Padding(
            padding: const EdgeInsets.only(top: 20.0)),

              Container(
              height: 40,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.lime, borderRadius: BorderRadius.circular(5)),
            
                // child: InkWell(
                //   child: Text ('8 Tips to Process an Accidental Pragnency', 
                //   textAlign: TextAlign.center, style:TextStyle(fontSize: 15)),
                //   onTap:() => launch('https://www.availnyc.org/8-tips-to-process-an-accidental-pregnancy')
                // )
              ),
            

          ]

        )
        )
      );
    }

    //Future<void> _launchUrl() async {
     // if (!await launchUrl(_url)) {
     // throw Exception('Could not launch $_url');
     // }
   // }


   //use Tile List and Favorite button 
  }
  */