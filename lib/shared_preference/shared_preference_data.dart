import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePeference {
  static late SharedPreferences prefs;
  static const String _keyUserName = "user_name";
  static const String _keyEmail = "user_email";

  static Future init() async => prefs = await SharedPreferences.getInstance();

  static Future setUserName(String userName) async =>
      await prefs.setString(_keyUserName, userName);
  static Future setUserEmail(String email) async =>
      await prefs.setString(_keyEmail, email);

  static String getUserName() => prefs.getString(_keyUserName) ?? "";
  static String getEmail() => prefs.getString(_keyEmail) ?? "";
}
