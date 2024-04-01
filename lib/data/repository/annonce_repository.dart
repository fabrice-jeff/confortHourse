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

  /**
   * @data
   * Total publication By Demarcheur
   * Total chambres actifs
   * Prix chambres actif
   */

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

    try {
      Map<String, dynamic>? result;
      result = jsonDecode(response.body);
      return result;
    } catch (e) {
      return null;
    }
  }

  //Total recent publication By Demarcheur
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

  //Total publication Actifs By Demarcheur
  Future<Map<String, dynamic>?> annoncesActifByDemarcheur() async {
    String? token = await SharePreferences.prefs.getString('token');
    const endpoint = Api.annoncesByDemarcheur;
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

  // Annonces par catégorie
  Future<Map<String, dynamic>?> getAnnonceByCategorie(
      Map<String, dynamic> data) async {
    const endpoint = Api.annonceByCategorie;
    final url = Uri.parse(api + endpoint);
    final response = await http.post(
      url,
      body: data,
      headers: {},
    );

    try {
      Map<String, dynamic>? result;
      result = jsonDecode(response.body);
      return result;
    } catch (e) {
      return null;
    }
  }

// Annonces simulairs par catégorie
  Future<Map<String, dynamic>?> getAnnonceSimulaireByCategorie(
      Map<String, dynamic> data) async {
    const endpoint = Api.annonceSimulaireByCategorie;
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
      return null;
    }
  }

  // Supprimer une annonces
  Future<Map<String, dynamic>?> deleteAnnonce(Map<String, dynamic> data) async {
    String? token = await SharePreferences.prefs.getString('token');
    const endpoint = Api.deleteAnnonce;
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
      return null;
    }
  }
}
