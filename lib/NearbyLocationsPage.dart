//import 'dart:ffi';

import 'main.dart';
import 'favPlacesPage.dart';
import 'package:flutter/material.dart';
//import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart'; //for watch MyAppState
import 'package:url_launcher/url_launcher.dart';


class NearbyLocations extends StatefulWidget {
  //const RelatedArticlesPage({super.key});

   @override
   State<NearbyLocations> createState() => _NearbyLocations();
 }

 class _NearbyLocations extends State<NearbyLocations> {

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var appstatetheme = Theme.of(context);
    var appState = context.watch<MyAppState>();
    IconData icon;
    IconData? _getIcon (place){
    if (appState.favoritePlaces.contains(place)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }
    return icon;}

    

    return MaterialApp(
      theme: appstatetheme,
      home: Scaffold(
        backgroundColor: colorScheme.surfaceVariant,
        appBar: AppBar(
        title: Text("Press ♡ to save places"),
        leading: Icon(Icons.book),
        actions: <Widget>[
          IconButton(
            onPressed: () {Navigator.pop(context);}, 
            icon: const Icon(Icons.arrow_back),
            tooltip: "Go Back"),
          IconButton(
            onPressed: () {Navigator.push(
                    context, MaterialPageRoute(builder: (_) => FavPlacePage()));}, 
            icon: const Icon(Icons.arrow_forward),
            tooltip: "Open favorite near by resources page")
        ],
        
      ),
        body:
        
        
        
        
        Column(          crossAxisAlignment: CrossAxisAlignment.start,
    
          children: [
            Expanded(
                    // Make better use of wide windows with a grid.
                    child:           
                      ListView(
                        children: [
                          for (var place in appState.resourceLocations)
                          ListTile(
                            leading: IconButton(
                              icon: Icon(_getIcon(place), semanticLabel: 'Bookmark'),
                                  color: colorScheme.primary,
                                  onPressed: () {
                                    appState.toggleFavoritePlace(place);
                                  },
                                ) ,
                                title: Text(place.infoWindow.title?? "Default")
                          ),
                          
                        ],),
              ),
          ],
        ),
      ),
    );}}