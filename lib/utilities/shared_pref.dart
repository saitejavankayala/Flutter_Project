import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences _sharedPrefs;

  static final SharedPrefs _instance = SharedPrefs._internal();

  factory SharedPrefs() => _instance;

  SharedPrefs._internal();

  Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  String get userEmail => _sharedPrefs.getString("email") ?? "";
  bool get userLoginIn => _sharedPrefs.getBool("islogin") ?? false;

  set userEmail(String value) {
    _sharedPrefs.setString("email", value);
  }
  set userLoginIn(bool value) {
    _sharedPrefs.setBool("islogin", value);
  }
}