import 'dart:convert';

import '../api/api.dart';
import 'package:http/http.dart' as http;

class AnnonceRepository {
  final String api;
  AnnonceRepository({required this.api});

  // Add Annonce
  Future<Map<String, dynamic>?> addAnnonce(Map<String, dynamic> data) async {
    final endpoint = Api.addAnnonce;
    final url = Uri.parse(api + endpoint);
    final response = await http.post(
      url,
      body: data,
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

  // Get type annonnce
  Future<Map<String, dynamic>?> getTypeAnnonce() async {
    final endpoint = Api.typeAnnonce;
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

  // Get type annonnce
  Future<Map<String, dynamic>?> getCategories() async {
    final endpoint = Api.categories;
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

  // Get type annonnce
  Future<Map<String, dynamic>?> getLocalisation() async {
    final endpoint = Api.villes;
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
}
