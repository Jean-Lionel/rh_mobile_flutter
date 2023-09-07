import 'dart:convert';

import 'package:rh_presence_mobile/model/presence.dart';
import 'package:http/http.dart' as http;
import 'package:rh_presence_mobile/routes/api_url.dart';
import 'package:rh_presence_mobile/shared_preference/shared_preference_data.dart';

class PresenceProvider {
  static Future<List<Presence>?> getListePresence() async {
    try {
      String token = UserSimplePeference.getToken();
      final response = await http.get(PRESENCE_URL, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print(jsonResponse);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
