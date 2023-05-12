/*import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LocationService {
  final String key = 'API_KEY';

  Future<String> getPlaceId(String input) async{
    final String url= 'https://https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=$key';


    var response = await http.get(Uri.parse(url));
    var jason = convert.jsonDecode(response.body);
    var placeId = jason['candidates'][0]['place_id'] as String;
    print(placeId);
    return placeId;

  }

}*/