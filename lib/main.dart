import 'package:flutter/cupertino.dart';
import 'forgotPWPage.dart';
import 'afterSignUpPage.dart';
import 'articlesPage.dart';
import 'favArticlesPage.dart';
import 'calendarPage.dart';
import 'loginPage.dart';
import 'dashboardPage.dart';

import 'package:flutter/material.dart';
//import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
//import 'package:url_launcher/url_launcher.dart';


//root of the widget tree
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

//materialApp provides the basis for an app
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
      title: 'Avocacy',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor:Color.fromARGB(255, 229, 237, 155)),
          
        ),
        home: LoginPage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {

  int pregnancy_week = 12;

  var allLinks = ["https://www.availnyc.org/do-relationships-change-during-an-unexpected-pregnancy",
  "https://www.availnyc.org/7-reasons-your-period-may-be-late",
  "https://www.availnyc.org/how-to-break-the-news-of-unexpected-pregnancy",
  "https://www.availnyc.org/8-questions-unexpected-pregnancy", 
  "https://www.availnyc.org/8-tips-to-process-an-accidental-pregnancy",
  //abortion links
  "https://www.availnyc.org/can-i-get-safe-abortion",
  "https://www.availnyc.org/everything-you-ve-ever-wanted-to-know-about-the-abortion-pill",
  "https://www.availnyc.org/when-is-it-safe-to-get-pregnant-after-an-abortion",
  "https://www.availnyc.org/abortion-recovery",
  "https://www.availnyc.org/abortion-information",
  "https://www.availnyc.org/confidential-abortion-information",
  "https://www.availnyc.org/abortion-options-in-nyc-what-you-need-to-know",
  "https://www.availnyc.org/three-things-know-abortion-new-york-city",
  
  ];

  var abortionLinks = ["https://www.availnyc.org/can-i-get-safe-abortion",
  "https://www.availnyc.org/everything-you-ve-ever-wanted-to-know-about-the-abortion-pill",
  "https://www.availnyc.org/when-is-it-safe-to-get-pregnant-after-an-abortion",
  "https://www.availnyc.org/abortion-recovery",
  "https://www.availnyc.org/abortion-information",
  "https://www.availnyc.org/confidential-abortion-information",
  "https://www.availnyc.org/abortion-options-in-nyc-what-you-need-to-know",
  "https://www.availnyc.org/three-things-know-abortion-new-york-city",
  ];
  var favorites = [];

  void toggleFavorite([String? link]) {
    if (favorites.contains(link)) {
      favorites.remove(link);
    } else {
      favorites.add(link);
    }
    notifyListeners();
  }

  void removeFavorite(String link) {
    favorites.remove(link);
    notifyListeners();
  }
}


class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    Widget page;
    switch (selectedIndex) {
      case 2:
        page = DashboardPage();
        break;
      case 0:
        page = Placeholder();//Mappage();
        break;
      case 1:
        page = RelatedArticlesPage(); //InformationPage();
        break;
      case 3:
        page = CalendarPage();//CalenderPage();
        break;
      case 4:
        page = Placeholder();//SettingPage();
        break;

      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    var mainArea = ColoredBox(
      color: colorScheme.surfaceVariant,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: page,
      ),
    );

    return Scaffold(
      body: Column(
        children: [
          Expanded(child: mainArea),
            SafeArea(
              child: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.map),
                    label: 'Nearby Resources',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: 'Information',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_month),
                    label: 'Calendar',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'Settings',
                  ),
                ],
                unselectedItemColor: colorScheme.primary,
                fixedColor: Colors.brown,
                currentIndex: selectedIndex,
                onTap: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
              },
            ),
          ),
        ],
          

      ),
    );
  }
}
  // class SettingPage extends StatefulWidget {
  //   @override 
  //   _SettingPageState createState() => _SettingPageState();
  // }
  // class _SettingPageState extends State<SettingPage> {  
  // }

  
  


/*
     return Scaffold(
      bottomNavigationBar: GNav(
        gap: 10,
        tabBackgroundColor: Colors.white,
        tabs: [
          GButton(icon: Icons.search,
          text: 'articles',onPressed:() {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => RelatedArticlesPage()));
                }),
          GButton(icon: Icons.home,
          text: 'Home', onPressed:() {
            Navigator.push(
              context, MaterialPageRoute(builder: (_) => MyHomePage()));
          }),
          GButton(icon: Icons.settings,
          text: 'Settings')
        ],),

      backgroundColor: Color.fromARGB(255, 209, 219, 193),
      body: SingleChildScrollView(
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
              height: 150,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.lime),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => MyHomePage()));
                }, style: ElevatedButton.styleFrom(
                  primary: Colors.white
                 ),
                child: Text(
                  'Nearby Resources Bookmarks',
                  style: TextStyle(fontSize: 20, color: Colors.brown),
                ),
              ),
            ),

            Padding(
            padding: const EdgeInsets.only(top: 10.0)),

            Container(
              height: 150,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => FavArticlesPage()));
                }, style: ElevatedButton.styleFrom(
                  primary: Colors.white
                 ),
                child: Text(
                  'Related Articles Bookmarks',
                  style: TextStyle(fontSize: 20, color: Colors.brown),
                ),
              ),
            )
          ],
        ),
      ),
     );*/