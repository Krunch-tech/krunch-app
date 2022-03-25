import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LocationService {
  final String key = "AIzaSyAm94zvZuJ9CyS-QwWEtmTgGwTrsT1f8KM";
  Future<String> getPlaceID(String input) async {
    final String url =
        "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=$key";
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var placeID = json['candidates'][0]['place_id'] as String;
    return placeID;
  }

  Future<Map<String, dynamic>> getPlace(String input) async {
    final String PlaceID = await getPlaceID(input);
    final String url =
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$PlaceID&key=$key";
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var results = json['result'] as Map<String, dynamic>;
    return results;
  }
}
