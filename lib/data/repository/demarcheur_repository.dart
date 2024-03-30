import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../utils/share_preference.dart';
import '../api/api.dart';

class DemarcheurRepository {
  final String api;
  DemarcheurRepository({required this.api});

  //Login
  Future<Map<String, dynamic>?> login(data) async {
    const endpoint = Api.login;
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
    const endpoint = Api.register;
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
    String? token = await SharePreferences.prefs.getString('token');
    const endpoint = Api.updateInformation;
    final url = Uri.parse(api + endpoint);
    final response = await http.post(
      url,
      body: data,
      headers: {
        'Authorization': "Bearer ${token}",
      },
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
    String? token = await SharePreferences.prefs.getString('token');
    const endpoint = Api.updatePassword;
    final url = Uri.parse(api + endpoint);
    final response = await http.post(
      url,
      body: data,
      headers: {
        'Authorization': "Bearer ${token}",
      },
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
    const endpoint = Api.deleteAccount;
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
