import 'dart:convert';
import 'package:http/http.dart' as http;

const kGoogleMapApiKey = 'GOOGLE_MAP_APIKEY';

String getLocationImage(double latitude, double longitude) {
  return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude=&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$kGoogleMapApiKey';
}

Future<String> getLocationAddress(double latitude, double longitude) async {
  final url = Uri.parse(
      'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$kGoogleMapApiKey');

  final response = await http.get(url);
  final resData = json.decode(response.body);

  return resData['results'][0]['formatted_address'];
}
