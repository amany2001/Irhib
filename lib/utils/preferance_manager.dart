import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';

class PreferanceManager extends GetxService {
  static late SharedPreferences _sharedPreferance;

  Future<PreferanceManager> InitPrefe() async {
    _sharedPreferance = await SharedPreferences.getInstance();
    return this;
  }

  static Future<bool> saveLanguage(
      {required String key, required String value}) async {
    return await _sharedPreferance.setString(key, value);
  }

  static dynamic getLanguage({required String key}) {
    return _sharedPreferance.get(key);
  }

  static Future<bool> saveUserToken(
      {required key, required String token}) async {
    return await _sharedPreferance.setString(key, token);
  }

  static dynamic getUserToken({required String key}) {
    return _sharedPreferance.get(key);
  }

  static Future<bool> saveUserType(
      {required key, required String userType}) async {
    return await _sharedPreferance.setString(key, userType);
  }

  static dynamic getUserType({required String key}) {
    return _sharedPreferance.get(key);
  }

  static Future<dynamic> saveUserData(
      {required String key, required User user}) async {
    return await _sharedPreferance.setString(key, jsonEncode(user));
  }

  static User getUserData({required String key}) {
    User user = User();
    String? userDataJson = _sharedPreferance.getString(key);
    if (userDataJson != null) {
      user = User.fromJson(jsonDecode(userDataJson));
    }
    return user;
  }

  static Future<bool> clearData({required String key}) {
    return _sharedPreferance.remove(key);
  }

  static Future<bool> clearAll() {
    return _sharedPreferance.clear();
  }
}
