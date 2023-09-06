import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rh_presence_mobile/routes/api_url.dart';
import 'package:rh_presence_mobile/screen/LoginScreen.dart';
import 'package:rh_presence_mobile/shared_preference/shared_preference_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutComponet extends StatefulWidget {
  const LogoutComponet({Key? key}) : super(key: key);

  @override
  State<LogoutComponet> createState() => _LogoutComponetState();
}

class _LogoutComponetState extends State<LogoutComponet> {
  late SharedPreferences prefs;
  late String? token;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initePrefs();
  }

  void initePrefs() async {
    prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
  }

  void logout(ctx) async {
    if (token!.isEmpty) {
      Navigator.of(ctx).popAndPushNamed(LoginScreen.routeName);
    }
    final response = await http.post(
      LOGOUT_URL,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer ${token}"
      },
      encoding: Encoding.getByName("utf-8"),
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['success']) {
        Navigator.of(ctx).popAndPushNamed(LoginScreen.routeName);
      }
    }
    Navigator.of(ctx).popAndPushNamed(LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => logout(context),
      child: Text('Logout'),
    );
  }
}
