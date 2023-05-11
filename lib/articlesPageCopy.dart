import 'main.dart';
import 'favArticlesPage.dart';
import 'package:flutter/material.dart';
//import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart'; //for watch MyAppState
import 'package:url_launcher/url_launcher.dart';

enum ArticleType { Ab, Pr, De, Af }

class RelatedArticlesPage extends StatefulWidget {
  //const RelatedArticlesPage({super.key});

   @override
   State<RelatedArticlesPage> createState() => _RelatedArticlesPage();
 }

 class _RelatedArticlesPage extends State<RelatedArticlesPage> {
  Set<ArticleType> selection = <ArticleType>{ArticleType.De, ArticleType.Ab};

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var appstatetheme = Theme.of(context);
    var appState = context.watch<MyAppState>();
    int? pw = appState.pregnancy_week;
    IconData icon;
    IconData? _getIcon (link){
    if (appState.favorites.contains(link)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }
    return icon;}


    // Void? displaylists(String link,List articlearray)
    // {
    //   for (var link in articlearray)            
    //     ListTile(
    //       leading: IconButton(
    //         icon: Icon(_getIcon(link), semanticLabel: 'Bookmark'),
    //         color: colorScheme.primary,
    //         onPressed: () {
    //           appState.toggleFavorite(link);
    //         },
    //       ) ,
    //       title: Text(
    //         capitalize(link.split('/').last.replaceAll('-', ' '))
    //         //pair.asLowerCase,
    //         //semanticsLabel: pair.asPascalCase,
    //       ),
    //       onTap: () => launch("$link")
    //     )
    // }


    return MaterialApp(
      theme: appstatetheme,
      home: Scaffold(
      backgroundColor: colorScheme.surfaceVariant,
      appBar: AppBar(
        title: Text("Select Categories"),
        leading: Icon(Icons.book),
        actions: <Widget>[
          IconButton(
            onPressed: () {Navigator.pop(context);}, 
            icon: const Icon(Icons.arrow_back),
            tooltip: "Open favorite articles page"),
          IconButton(
            onPressed: () {Navigator.push(
                    context, MaterialPageRoute(builder: (_) => FavArticlesPage()));}, 
            icon: const Icon(Icons.arrow_forward),
            tooltip: "Open favorite articles page")
        ],
        
      ),
      
      body: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //MultipleChoice(),
            SegmentedButton<ArticleType>(
              segments: const <ButtonSegment<ArticleType>>[
                ButtonSegment<ArticleType>(value: ArticleType.Ab, label: Text('Abortion')),
                ButtonSegment<ArticleType>(value: ArticleType.Pr, label: Text('Pregnancy')),
                ButtonSegment<ArticleType>(value: ArticleType.De, label: Text('Decision Making')),
                ButtonSegment<ArticleType>(value: ArticleType.Af, label: Text('After Abortion Care')),
              ],
              selected: selection,
              onSelectionChanged: (Set<ArticleType> newSelection) {
                setState(() {
                  selection = newSelection;
                });
              },
              multiSelectionEnabled: true,
            ),
                Expanded(
              // Make better use of wide windows with a grid.
              child:           
                ListView(
                  children: [
                    if (selection.contains(ArticleType.De))
                      //displaylists(link, appState.decisionLinks),
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
                      
                      if (selection.contains(ArticleType.Ab))                       
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

                      if (selection.contains(ArticleType.Af))
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

                      if (selection.contains(ArticleType.Pr))
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
      

    ),
    ); 
  }
}
/*enum ArticleType { Ab, Pr, De, Af }

class MultipleChoice extends StatefulWidget {
  const MultipleChoice({super.key});

  @override
  State<MultipleChoice> createState() => _MultipleChoiceState();
}

class _MultipleChoiceState extends State<MultipleChoice> {
  Set<ArticleType> selection = <ArticleType>{ArticleType.Pr, ArticleType.Ab};

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<ArticleType>(
      segments: const <ButtonSegment<ArticleType>>[
        ButtonSegment<ArticleType>(value: ArticleType.Ab, label: Text('Abortion')),
        ButtonSegment<ArticleType>(value: ArticleType.Pr, label: Text('Pregnancy')),
        ButtonSegment<ArticleType>(value: ArticleType.De, label: Text('Decision Making')),
        ButtonSegment<ArticleType>(value: ArticleType.Af, label: Text('After Abortion Care'),
        ),
      ],
      selected: selection,
      onSelectionChanged: (Set<ArticleType> newSelection) {
        setState(() {
          selection = newSelection;
        });
      },
      multiSelectionEnabled: true,
    );
  }
}

*/

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
