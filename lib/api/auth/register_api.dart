import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:yalla_mazad/model/auth/register_model.dart';
import 'package:yalla_mazad/utils/api_url.dart';

class RegisterApi {
  Future<RegisterModel?> data({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.register}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
      };
      var body = jsonEncode({
        "name": name,
        "email": email,
        "password": password,
      });
      log("Response:: RegisterResponse\nUrl:: $url\nheaders:: $headers\nbody:: $body");
      http.Response response =
          await http.post(uri, body: body, headers: headers);
      log("RegisterStatusCode:: ${response.statusCode}  RegisterBody:: ${response.body}");
      RegisterModel registerModel =
          RegisterModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return registerModel;
      } else if (response.statusCode == 500) {
        return registerModel;
      } else {
        throw "Register Error";
      }
    } catch (e) {
      log("Register Error $e");
      return null;
    }
  }
}
