import 'package:http/http.dart' as http;
import 'dart:convert';

import '../api/api.dart';

class BaseRepository {
  final String api;
  BaseRepository({required this.api});
  // Get pays
  // Get pays
  Future<Map<String, dynamic>?> getPays() async {
    final endpoint = Api.pays;
    final url = Uri.parse(api + endpoint);
    final response = await http.get(
      url,
      headers: {},
    );
    Map<String, dynamic>? result;

    try {
      result = jsonDecode(response.body);
      return result;
    } catch (e) {
      print('erreur');
      return null;
    }
  }

  // Get categorie
  Future<Map<String, dynamic>?> getCategories() async {
    const endpoint = Api.categories;
    final url = Uri.parse(api + endpoint);
    final response = await http.get(
      url,
      headers: {},
    );
    Map<String, dynamic>? result;
    try {
      result = jsonDecode(response.body);
      return result;
    } catch (e) {
      return null;
    }
  }
}
