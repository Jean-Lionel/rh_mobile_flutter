import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rh_presence_mobile/routes/api_url.dart';

class LogoutComponet extends StatelessWidget {
  const LogoutComponet({Key? key}) : super(key: key);

  void logout() async {
    final response = await http.post(LOGIN_URL);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: logout,
      child: Text('Logout'),
    );
  }
}
