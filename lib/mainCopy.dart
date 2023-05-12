import 'package:flutter/cupertino.dart';
import 'articlesPageCopy.dart';
import 'calendarPage.dart';
import 'loginPage.dart';
import 'dashboardPage.dart';
import 'settingPage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:google_maps_flutter_web/google_maps_flutter_web.dart';

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
        title: 'Avocay',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFEFF1DB)),
        ),
        home: LoginPage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  //global variables
  int pregnancy_week = -1;

  var allLinks = [
    "https://www.availnyc.org/do-relationships-change-during-an-unexpected-pregnancy",
    "https://www.availnyc.org/7-reasons-your-period-may-be-late",
    "https://www.availnyc.org/how-to-break-the-news-of-unexpected-pregnancy",
    "https://www.availnyc.org/8-questions-unexpected-pregnancy",
    "https://www.availnyc.org/8-tips-to-process-an-accidental-pregnancy",
    //pregnancy links
    "https://www.availnyc.org/can-i-get-safe-abortion",
    "https://www.availnyc.org/everything-you-ve-ever-wanted-to-know-about-the-abortion-pill",
    "https://www.availnyc.org/abortion-recovery",
    "https://www.availnyc.org/abortion-information",
    "https://www.availnyc.org/confidential-abortion-information",
    "https://www.availnyc.org/abortion-options-in-nyc-what-you-need-to-know",
    "https://www.availnyc.org/three-things-know-abortion-new-york-city",
    //abortion links
    "https://www.availnyc.org/making-a-confident-decision-about-an-unplanned-pregnancy",
    "https://www.availnyc.org/pregnant-options",
    "https://www.availnyc.org/what-happens-if-im-pregnant-and-single",
    "https://www.availnyc.org/can-i-be-a-student-while-pregnant",
    "https://www.availnyc.org/can-finish-school-pregnant",
    "https://www.availnyc.org/abortion-options-in-nyc-what-you-need-to-know"
        //decisions links
        "https://www.availnyc.org/5-tips-for-processing-your-abortion",
    "https://www.availnyc.org/when-is-it-safe-to-get-pregnant-after-an-abortion",
    "https://www.availnyc.org/relationships-after-an-abortion",
    "https://www.availnyc.org/after-abortion-my-partner-doesnt-want-to-talk",
    "https://www.availnyc.org/emotions-after-abortion"
    //after abortion links
  ];

  var abortionLinks = [
    "https://www.availnyc.org/can-i-get-safe-abortion",
    "https://www.availnyc.org/everything-you-ve-ever-wanted-to-know-about-the-abortion-pill",
    "https://www.availnyc.org/abortion-recovery",
    "https://www.availnyc.org/abortion-information",
    "https://www.availnyc.org/confidential-abortion-information",
    "https://www.availnyc.org/abortion-options-in-nyc-what-you-need-to-know",
    "https://www.availnyc.org/three-things-know-abortion-new-york-city",
  ];

  var pregnancyLinks = [
    "https://www.availnyc.org/do-relationships-change-during-an-unexpected-pregnancy",
    "https://www.availnyc.org/7-reasons-your-period-may-be-late",
    "https://www.availnyc.org/how-to-break-the-news-of-unexpected-pregnancy",
    "https://www.availnyc.org/8-questions-unexpected-pregnancy",
    "https://www.availnyc.org/8-tips-to-process-an-accidental-pregnancy"
  ];

  var decisionLinks = [
    "https://www.availnyc.org/making-a-confident-decision-about-an-unplanned-pregnancy",
    "https://www.availnyc.org/pregnant-options",
    "https://www.availnyc.org/what-happens-if-im-pregnant-and-single",
    "https://www.availnyc.org/can-i-be-a-student-while-pregnant",
    "https://www.availnyc.org/can-finish-school-pregnant",
    "https://www.availnyc.org/abortion-options-in-nyc-what-you-need-to-know"
  ];

  var afterAbortionLinks = [
    "https://www.availnyc.org/5-tips-for-processing-your-abortion",
    "https://www.availnyc.org/when-is-it-safe-to-get-pregnant-after-an-abortion",
    "https://www.availnyc.org/relationships-after-an-abortion",
    "https://www.availnyc.org/after-abortion-my-partner-doesnt-want-to-talk",
    "https://www.availnyc.org/emotions-after-abortion"
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

String capitalize(String value) {
  var result = value[0].toUpperCase();
  bool cap = true;
  for (int i = 1; i < value.length; i++) {
    if (value[i - 1] == "n" && value[i] == "y") {
      result = result + value[i].toUpperCase();
    } else if (value[i - 1] == "y" && value[i] == "c") {
      result = result + value[i].toUpperCase();
    } else if (value[i - 1] == " " && value[i] == "i") {
      result = result + value[i].toUpperCase();
    } else if (value[i - 1] == "i" && value[i] == "m") {
      result = "$result'${value[i]}";
    } else if (value[i - 1] == " " && value[i] == "v") {
      result = "$result'${value[i]}";
    } else if (value[i - 1] == " ") {
      result = result + value[i].toUpperCase();
    } else {
      result = result + value[i];
      cap = false;
    }
  }
  return result;
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
        page = Placeholder(); //Mappage();
        break;
      case 1:
        page = RelatedArticlesPage(); //InformationPage();
        break;
      case 3:
        page = CalendarPage(); //CalenderPage();
        break;
      case 4:
        page = SettingPage(); //SettingPage();
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
                  label: 'Near Resources',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Articles',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset("assets/images/avocado.png", height: 40),
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
  