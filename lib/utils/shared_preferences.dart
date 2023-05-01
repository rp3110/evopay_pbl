import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

///preference keys
const String keyUserDetail = 'UserDetail';

class Preferences {
  static Future<bool> isContainKey(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }

  static Future<String?> getUserDetail() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(keyUserDetail);
  }

  static void saveUserDetail(String userDetailJSON) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(keyUserDetail, userDetailJSON);
  }

  static Future<bool> removeUserDetail() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.remove(keyUserDetail);
  }
}
