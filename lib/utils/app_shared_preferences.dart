import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'utils.dart';

class AppSharedPreferences {
///////////////////////////////////////////////////////////////////////////////
  static Future<SharedPreferences> getInstance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }

///////////////////////////////////////////////////////////////////////////////
  static Future<void> clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

///////////////////////////////////////////////////////////////////////////////
  static Future<bool> isUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(AppSharedPreferenceKeys.IS_USER_LOGGED_IN);
  }

  static Future<void> setUserLoggedIn(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(AppSharedPreferenceKeys.IS_USER_LOGGED_IN, isLoggedIn);
  }

///////////////////////////////////////////////////////////////////////////////
/*  static Future<User> getUserProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

  }

  static Future<void> setUserProfile(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userProfileJson = json.encode(user);
    return prefs.setString(AppSharedPreferenceKeys.USER, userProfileJson);
  }*/

  /////////////////////////////////////////////////////////////////////////////
  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key));
  }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

}