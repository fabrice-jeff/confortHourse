import 'dart:convert';

import 'package:conforthourse/models/categorie.dart';
import 'package:http/http.dart' as http;

class CategorieController {
  static Future<List<Categorie>> all() async {
    List<Categorie> categories = [];
    final String url =
        "https://conforthourse.000webhostapp.com/core/categories/all.php";
    final response = await http.read(Uri.parse(url));
    print(response);
    var results = jsonDecode(response);
    for (var element in results) {
      var categorie = Categorie.fromJson(element);
      categories.add(categorie);
    }
    return categories;
  }
}
