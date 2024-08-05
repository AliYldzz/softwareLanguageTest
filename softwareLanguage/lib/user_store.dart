import 'package:flutter/material.dart';

class UserStore with ChangeNotifier {
  String? _username;
  String? _email;
  String? _name;
  String? _password;

  void register(String username, String email, String name, String password) {
    _username = username;
    _email = email;
    _name = name;
    _password = password;
    notifyListeners();
  }

  bool login(String email, String password) {
    if (_email == null || _password == null) {
      // Kullanıcı henüz kayıt olmadı
      return false;
    }
    return _email == email && _password == password;
  }

  String? get username => _username;
  String? get email => _email;
  String? get name => _name;

   void setUser(String username, String email, String name, String password) {
    _username = username;
    _email = email;
    _name = name;
    _password = password;
    notifyListeners();
  }
}
