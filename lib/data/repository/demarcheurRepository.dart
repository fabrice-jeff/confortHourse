import 'package:http/http.dart' as http;
import 'dart:convert';

import '../api/api.dart';

class DemarcheurRepository {
  final String api;
  DemarcheurRepository({required this.api});

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
}
