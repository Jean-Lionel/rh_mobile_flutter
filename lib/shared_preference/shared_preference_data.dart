import 'dart:convert';

import 'package:rh_presence_mobile/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  late SharedPreferences prefs;
  String? _token = "";
  String? _user = null;
  LocalData() {
    initSharedPreferences();
  }
  void initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token');
    _user = prefs.getString('user');
  }

  void logoutUser() {
    prefs.remove('token');
    prefs.remove('user');
  }

  String? get token {
    return _token;
  }

  String? get user {
    return _user;
  }

  User get connectedUser {
    initSharedPreferences();
    print("======== CONnected user");
    print(_user);
    print("======== CONnected user");
    return new User();
  }
}
