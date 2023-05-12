import 'dart:async';

import 'package:avocacy/NearbyLocationsPage.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'articlesPageCopy.dart';
import 'calendarPage.dart';
import 'loginPage.dart';
import 'dashboardPage.dart';
import 'settingPage.dart';
import 'location_service.dart';

//import 'package:google_maps_flutter_web/google_maps_flutter_web.dart';

import 'package:flutter/material.dart';
//import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
//import 'package:url_launcher/url_launcher.dart';

//root of the widget tree
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();

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
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFEFF1DB)),
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
  var favoritePlaces = [];

  var resourceLocations= [
 Marker(
    markerId: MarkerId('_kClinic1'),
    infoWindow: const InfoWindow(
        title: 'Albany Health Center - Upper Hudson Planned Parenthood',
        snippet: '855 Central Ave, Albany, NY 12206'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(42.6809, -73.7885),
  ),

  Marker(
    markerId: MarkerId('_kClinic2'),
    infoWindow: const InfoWindow(
        title: 'Office of Michael Afshari',
        snippet: '216-04 Union Tpke 1st Floor, Queens, NY 11364'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(40.7343, -73.7549),
  ),

  Marker(
    markerId: MarkerId('_kClinic3'),
    infoWindow: const InfoWindow(
        title: 'Bronx Lebanon OB/GYN Group, Dr. Benita Gross',
        snippet: '1650 Grand Concourse, Bronx, NY 10457'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(40.8436, -73.9117),
  ),

  Marker(
    markerId: MarkerId('_kClinic4'),
    infoWindow: const InfoWindow(
        title: 'Dr. Emily Women Health Center',
        snippet: '642 Southern Blvd, Bronx, NY 10455'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(40.8124, -73.9031),
  ),

  Marker(
    markerId: MarkerId('_kClinic5'),
    infoWindow: const InfoWindow(
        title: 'Bronx Abortion',
        snippet: '2070 Eastchester Rd, Bronx, NY 10461'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(40.8552, 73.8435),
  ),

  Marker(
    markerId: MarkerId('_kClinic6'),
    infoWindow: const InfoWindow(
        title: 'Lincoln Medical Center',
        snippet: '234 E 149th St, Bronx, NY 10451'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(40.8177, 73.924),
  ),

  Marker(
    markerId: MarkerId('_kClinic7'),
    infoWindow: const InfoWindow(
        title: 'The Bronx Center-Planned Parenthood',
        snippet: '349 E 149th St 2nd Floor, Bronx, NY 10451'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(40.8169, -73.9197),
  ),

  Marker(
    markerId: MarkerId('_kClinic8'),
    infoWindow: const InfoWindow(
        title: 'ColumbiaDoctors - Obstetrics & Gynecology (OBGYN)',
        snippet: '622 W 168th St, New York, NY 10032'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(40.8415, -73.9411),
  ),
  ];

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

  void toggleFavoritePlace([Marker? place]) {
    if (favoritePlaces.contains(place)) {
      favoritePlaces.remove(place);
    } else {
      favoritePlaces.add(place);
    }
    notifyListeners();
  }

  void removeFavoritePlace(Marker place) {
    favoritePlaces.remove(place);
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
  //const MyHomePage({super.key});

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
      case 4:
        page = SettingPage(); //settingpage();
        break;
      case 1:
        page = RelatedArticlesPage(); //InformationPage();
        break;
      case 3:
        page = CalendarPage(); //CalenderPage();
        break;
      case 0:
        page = MapSample(); //MapPage();
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

class MapSample extends StatefulWidget {
  MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  TextEditingController _searchController = TextEditingController();

  static CameraPosition _kManhattan = CameraPosition(
    //target: LatLng(37.42796133580664, -122.085749655962),
    target: LatLng(40.807444, 286.036026),
    zoom: 14.4746,
  );



  // static final Marker _kClinicMarker1 = Marker(
  //   markerId: MarkerId('_kClinic1'),
  //   infoWindow: const InfoWindow(
  //       title: 'Albany Health Center - Upper Hudson Planned Parenthood',
  //       snippet: '855 Central Ave, Albany, NY 12206'),
  //   icon: BitmapDescriptor.defaultMarker,
  //   position: LatLng(42.6809, -73.7885),
  // );

  // static final Marker _kClinicMarker2 = Marker(
  //   markerId: MarkerId('_kClinic2'),
  //   infoWindow: const InfoWindow(
  //       title: 'Office of Michael Afshari',
  //       snippet: '216-04 Union Tpke 1st Floor, Queens, NY 11364'),
  //   icon: BitmapDescriptor.defaultMarker,
  //   position: LatLng(40.7343, -73.7549),
  // );

  // static final Marker _kClinicMarker3 = Marker(
  //   markerId: MarkerId('_kClinic3'),
  //   infoWindow: const InfoWindow(
  //       title: 'Bronx Lebanon OB/GYN Group, Dr. Benita Gross',
  //       snippet: '1650 Grand Concourse, Bronx, NY 10457'),
  //   icon: BitmapDescriptor.defaultMarker,
  //   position: LatLng(40.8436, -73.9117),
  // );

  // static final Marker _kClinicMarker4 = Marker(
  //   markerId: MarkerId('_kClinic4'),
  //   infoWindow: const InfoWindow(
  //       title: 'Dr. Emily Women Health Center',
  //       snippet: '642 Southern Blvd, Bronx, NY 10455'),
  //   icon: BitmapDescriptor.defaultMarker,
  //   position: LatLng(40.8124, -73.9031),
  // );

  // static final Marker _kClinicMarker5 = Marker(
  //   markerId: MarkerId('_kClinic5'),
  //   infoWindow: const InfoWindow(
  //       title: 'Bronx Abortion',
  //       snippet: '2070 Eastchester Rd, Bronx, NY 10461'),
  //   icon: BitmapDescriptor.defaultMarker,
  //   position: LatLng(40.8552, 73.8435),
  // );

  // static final Marker _kClinicMarker6 = Marker(
  //   markerId: MarkerId('_kClinic6'),
  //   infoWindow: const InfoWindow(
  //       title: 'Lincoln Medical Center',
  //       snippet: '234 E 149th St, Bronx, NY 10451'),
  //   icon: BitmapDescriptor.defaultMarker,
  //   position: LatLng(40.8177, 73.924),
  // );

  // static final Marker _kClinicMarker7 = Marker(
  //   markerId: MarkerId('_kClinic7'),
  //   infoWindow: const InfoWindow(
  //       title: 'The Bronx Center-Planned Parenthood',
  //       snippet: '349 E 149th St 2nd Floor, Bronx, NY 10451'),
  //   icon: BitmapDescriptor.defaultMarker,
  //   position: LatLng(40.8169, -73.9197),
  // );

  // static final Marker _kClinicMarker8 = Marker(
  //   markerId: MarkerId('_kClinic8'),
  //   infoWindow: const InfoWindow(
  //       title: 'ColumbiaDoctors - Obstetrics & Gynecology (OBGYN)',
  //       snippet: '622 W 168th St, New York, NY 10032'),
  //   icon: BitmapDescriptor.defaultMarker,
  //   position: LatLng(40.8415, -73.9411),
  // );

  static const CameraPosition _kHudson = CameraPosition(
      bearing: 192.8334901395799,
      //target: LatLng(37.43296265331129, -122.08832357078792),
      target: LatLng(40.807071, 286.030293),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return  Scaffold(
        appBar: AppBar(
          
          title: Text("Google Maps"),
          actions: <Widget>[
          // IconButton(
          //   onPressed: () {Navigator.pop(context);}, 
          //   icon: const Icon(Icons.arrow_back),
          //   tooltip: "Open List of Near By Resources"),
          IconButton(
            onPressed: () {Navigator.push(
                    context, MaterialPageRoute(builder: (_) => NearbyLocations()));}, 
            icon: const Icon(Icons.arrow_forward),
            tooltip: "Open List of Near By Resources")
        ],

        ),
        body: 
            Column(
            children: [
              Row(children: [
                Expanded(
                    child: TextFormField(
                  controller: _searchController,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(hintText: 'Search by City'),
                  onChanged: (value) {
                    print(value);
                  },
                )),
                IconButton(
                  onPressed: () {
                    //LocationService().getPlaceId(_searchController.text);
                                  },
                  icon: Icon(Icons.search),
                ),
              ]),
              Expanded(
                child: GoogleMap(
                  mapType: MapType.normal,
                  markers: {...appState.resourceLocations},
                  // {
                  //   _kClinicMarker1,
                  //   _kClinicMarker2,
                  //   _kClinicMarker3,
                  //   _kClinicMarker4,
                  //   _kClinicMarker5,
                  //   _kClinicMarker6,
                  //   _kClinicMarker7,
                  //   _kClinicMarker8
                  // }
                
                  initialCameraPosition: _kManhattan,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
              ),
            ],
          ),
          
          
        /* floatingActionButton: FloatingActionButton.extended(
          onPressed: _goToTheLake,
          label: const Text('To the lake!'),
          icon: const Icon(Icons.directions_boat),
    */
      );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kHudson));
  }
}
  // class SettingPage extends StatefulWidget {
  //   @override 
  //   _SettingPageState createState() => _SettingPageState();
  // }
  // class _SettingPageState extends State<SettingPage> {  
  // }