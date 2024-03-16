import 'package:http/http.dart' as http;
import 'dart:convert';

import '../api/api.dart';

class DemarcheurRepository {
  final String api;
  DemarcheurRepository({required this.api});
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

  // Get Ville By pays
  Future<Map<String, dynamic>?> getVilleByPays(
      Map<String, dynamic> data) async {
    final endpoint = Api.villeByPays;
    final url = Uri.parse(api + endpoint);
    final response = await http.post(
      url,
      body: data,
      headers: {},
    );
    Map<String, dynamic>? result;
    print(response.body);

    try {
      result = jsonDecode(response.body);
      return result;
    } catch (e) {
      print('erreur');
      return null;
    }
  }

  //Login
  Future<Map<String, dynamic>?> login(data) async {
    final endpoint = Api.login;
    final url = Uri.parse(api + endpoint);
    final response = await http.post(
      url,
      body: data,
      headers: {},
    );
    Map<String, dynamic> results;
    try {
      results = jsonDecode(response.body);
      return results;
    } catch (e) {
      print('erreur');
      return null;
    }
  }

  //Register
  Future<Map<String, dynamic>?> register(data) async {
    final endpoint = Api.register;
    final url = Uri.parse(api + endpoint);
    final response = await http.post(
      url,
      body: data,
      headers: {},
    );
    Map<String, dynamic>? results;
    try {
      results = jsonDecode(response.body);

      return results;
    } catch (e) {
      print('erreur');
      return null;
    }
  }

  //Update Information
  Future<Map<String, dynamic>?> updateInformation(data) async {
    final endpoint = Api.updateInformation;
    final url = Uri.parse(api + endpoint);
    final response = await http.post(
      url,
      body: data,
      headers: {},
    );
    Map<String, dynamic>? results;
    try {
      results = jsonDecode(response.body);

      return results;
    } catch (e) {
      print('erreur');
      return null;
    }
  }

  //Update Password
  Future<Map<String, dynamic>?> updatePassword(data) async {
    final endpoint = Api.updatePassword;
    final url = Uri.parse(api + endpoint);
    final response = await http.post(
      url,
      body: data,
      headers: {},
    );
    Map<String, dynamic>? results;
    try {
      results = jsonDecode(response.body);

      return results;
    } catch (e) {
      print('erreur');
      return null;
    }
  }

  //Update Password
  Future<Map<String, dynamic>?> deleteAccount(data) async {
    final endpoint = Api.deleteAccount;
    final url = Uri.parse(api + endpoint);
    final response = await http.post(
      url,
      body: data,
      headers: {},
    );
    Map<String, dynamic>? results;
    try {
      results = jsonDecode(response.body);

      return results;
    } catch (e) {
      print('erreur');
      return null;
    }
  }
}
