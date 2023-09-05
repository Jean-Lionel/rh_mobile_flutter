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

  String? get token {
    //initSharedPreferences();
    return _token;
  }

  String? get user {
    return _user;
  }
}
