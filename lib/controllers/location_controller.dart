import 'dart:convert';

import 'package:conforthourse/models/location.dart';
import 'package:http/http.dart' as http;

class LocationController {
  //Récuperer toutes les locations
  static Future<List<Location>> all() async {
    List<Location> locations = [];
    final String url =
        "https://conforthourse.000webhostapp.com/core/locations/all.php";
    final response = await http.read(Uri.parse(url));
    var results = jsonDecode(response);
    for (var json in results) {
      var location = Location.fromJson(json);
      locations.add(location);
    }
    return locations;
  }

  //Récupération de la location avec un  id particulier
  static Future<Location> find(String code) async {
    Location location;
    final String url =
        "https://conforthourse.000webhostapp.com/core/locations/find.php?code='${code}'";
    final response = await http.read(
      Uri.parse(url),
    );
    location = Location.fromJson(jsonDecode(response));
    return location;
  }

  static Future<List<Location>> findByCategorie(
      String code, int categorie) async {
    List<Location> locations = [];
    final String url =
        "https://conforthourse.000webhostapp.com/core/locations/find_by_categorie.php?code='${code}'&categorie=${categorie}";
    final response = await http.read(Uri.parse(url));
    var results = jsonDecode(response);
    for (var location in results) {
      location = Location.fromJson(location);
      locations.add(location);
    }

    return locations;
  }
}
