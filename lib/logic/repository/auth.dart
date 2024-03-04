import 'dart:convert';

import 'package:google_drive_clone/models/logindetails.dart';
import 'package:http/http.dart' as http;
import 'package:google_drive_clone/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  static Future<Map> login(data) async {
    print(data);
    var response = await http.post(
      Uri.parse(Urls.login),
      body: json.encode(data),
    );

    if (response.statusCode != 200) {
      return {
        "message": jsonDecode(response.body)['message'],
        "data": null,
      };
    }

    var responseBody = jsonDecode(response.body);
    final pref = await SharedPreferences.getInstance();
    pref.setString('logindata', jsonEncode(responseBody['data']));

    return {
      "message": responseBody['message'],
      "data": LoginDetails.fromJson(responseBody['data']),
    };
  }
}
