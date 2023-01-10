import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:yalla_mazad/model/auth/social_log_in_model.dart';
import 'package:yalla_mazad/utils/api_url.dart';

class SocialLoginApi {
  Future<SocialLogInModel?> data({
    required String email,
    required String username,
  }) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.socialLogin}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
      };
      var body = jsonEncode({
        "email": email,
        "username": username,
      });
      log("Response:: SocialLogInResponse\nUrl:: $url\nheaders:: $headers\nbody:: $body");
      http.Response response =
          await http.post(uri, body: body, headers: headers);
      log("SocialLogInStatusCode:: ${response.statusCode}  SocialLogInBody:: ${response.body}");
      SocialLogInModel socialLogInModel =
          SocialLogInModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return socialLogInModel;
      } else if (response.statusCode == 500) {
        return socialLogInModel;
      } else {
        throw "SocialLogIn Error";
      }
    } catch (e) {
      log("SocialLogIn Error $e");
      return null;
    }
  }
}
