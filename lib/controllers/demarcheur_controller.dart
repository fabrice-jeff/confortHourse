import 'package:http/http.dart' as http;

class DemarcheurController {
  static Future<bool> register(demarcheur) async {
    final String url =
        "https://conforthourse.000webhostapp.com/core/demarcheurs/register.php";
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': "application/x-www-form-urlencoded",
      },
      body: demarcheur.toJson(),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<String?> login(Map<String, String> data) async {
    final String url =
        "https://conforthourse.000webhostapp.com/core/demarcheurs/login.php";
    final response = await http.post(
      Uri.parse(url),
      headers: {
        // 'Content-Type': 'application/json; charset=UTF-8',
        'Content-Type': "application/x-www-form-urlencoded",
      },
      body: data,
    );
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }
}
