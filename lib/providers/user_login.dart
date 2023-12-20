import 'package:flutter/material.dart';

class UserLogin extends ChangeNotifier {
  String email = "";
  UserLogin();

  void connect(String email) {
    this.email = email;
    notifyListeners();
  }
}
