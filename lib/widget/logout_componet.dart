import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rh_presence_mobile/routes/api_url.dart';
import 'package:rh_presence_mobile/screen/LoginScreen.dart';
import 'package:rh_presence_mobile/shared_preference/shared_preference_data.dart';

class LogoutComponet extends StatelessWidget {
  const LogoutComponet({Key? key}) : super(key: key);

  void logout(ctx) async {
    LocalData l = new LocalData();

    if (l.token!.isEmpty) {
      Navigator.of(ctx).popAndPushNamed(LoginScreen.routeName);
    }

    final response = await http.post(LOGOUT_URL, headers: {
      "Content-Type": "application/json",
      'Authentication': 'Bearer ${l.token}'
    });
    var jsonResponse = jsonDecode(response.body);
    print("================================");
    print(response.body);
    if (jsonResponse['success']) {
      LocalData l = new LocalData();
      l.logoutUser();
      Navigator.of(ctx).popAndPushNamed(LoginScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => logout(context),
      child: Text('Logout'),
    );
  }
}
