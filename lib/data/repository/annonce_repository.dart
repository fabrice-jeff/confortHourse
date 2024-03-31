import 'dart:convert';

import '../../utils/share_preference.dart';
import '../api/api.dart';
import 'package:http/http.dart' as http;

class AnnonceRepository {
  final String api;
  AnnonceRepository({required this.api});

  // Add Annonce
  Future<Map<String, dynamic>?> addAnnonce(Map<String, dynamic> data) async {
    String? token = await SharePreferences.prefs.getString('token');
    const endpoint = Api.addAnnonce;
    final url = Uri.parse(api + endpoint);
    final response = await http.post(
      url,
      body: data,
      headers: {
        'Authorization': "Bearer ${token}",
      },
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

  //Total publication By Demarcheur
  Future<Map<String, dynamic>?> totalPublication() async {
    String? token = await SharePreferences.prefs.getString('token');
    print(token);
    const endpoint = Api.totalPublicationByDemarcheur;
    final url = Uri.parse(api + endpoint);
    final response = await http.get(
      url,
      headers: {
        'Authorization': "Bearer ${token}",
      },
    );
    print(response.body);
    try {
      Map<String, dynamic>? result;
      result = jsonDecode(response.body);
      return result;
    } catch (e) {
      return null;
    }
  }

  //Total publication By Demarcheur
  Future<Map<String, dynamic>?> recentsPublication() async {
    String? token = await SharePreferences.prefs.getString('token');
    const endpoint = Api.recentsPublications;
    final url = Uri.parse(api + endpoint);
    final response = await http.get(
      url,
      headers: {
        'Authorization': "Bearer ${token}",
      },
    );
    try {
      Map<String, dynamic>? result;
      result = jsonDecode(response.body);
      return result;
    } catch (e) {
      return null;
    }
  }

  // Get annonceBy limite
  Future<Map<String, dynamic>?> getAnnonceByLimite(
      Map<String, dynamic> data) async {
    final endpoint = Api.annonceByLimite;
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
      print('erreufsdcrEEAZ5');
      return null;
    }
  }

  // Get villes
  Future<Map<String, dynamic>?> getAnnonceByCategorie(
      Map<String, dynamic> data) async {
    final endpoint = Api.annonceByCategorie;
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

  Future<Map<String, dynamic>?> getOtherAnnonceByCategorie(
      Map<String, dynamic> data) async {
    final endpoint = Api.otherAnnonceByCategorie;
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
}
