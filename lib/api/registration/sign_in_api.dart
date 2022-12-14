import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:yalla_mazad/utils/api_url.dart';
import '../../model/auth/sign_in_model.dart';

class SignInApi {
  Future<SignInModel?> data({
    required String phone,
    required String password,
  }) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.signIn}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
      };
      var body = jsonEncode({
        "phone": '+962$phone',
        "password": password,
      });
      log("Response:: SignInResponse\nUrl:: $url\nheaders:: $headers\nbody:: $body");
      http.Response response = await http.post(uri, body: body, headers: headers);
      log("SignInStatusCode:: ${response.statusCode}  SignInBody:: ${response.body}");
      SignInModel signInModel = SignInModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return signInModel;
      } else if (response.statusCode == 500) {
        return signInModel;
      } else {
        throw "SignIn Error";
      }
    } catch (e) {
      log("SignIn Error $e");
      return null;
    }
  }
}
