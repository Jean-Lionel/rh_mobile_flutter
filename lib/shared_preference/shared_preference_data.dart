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
    print("LocalData.initSharedPreferences");
    prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token');
    _user = prefs.getString('user');
  }

  void logoutUser() {
    prefs.remove('token');
    prefs.remove('user');
  }

  String? get token {
    //initSharedPreferences();
    return _token;
  }

  String? get user {
    return _user;
  }

  User get connectedUser {
    var x = _user != null ? jsonDecode(_user!) : '[{"id": "1"}]';
    User r = User.fromJosn(x);
    return r;
  }
}
