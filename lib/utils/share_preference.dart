import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../data/models/demarcheur.dart';

class SharePreferences {
  SharePreferences._();
  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Demarcheur? getActeur() {
    String? acteurJson = prefs.getString('acteur');
    Demarcheur? acteur;
    if (acteurJson != null) {
      acteur = Demarcheur.fromJson(jsonDecode(acteurJson));
      print(acteur);
    }
    return acteur;
  }
}
