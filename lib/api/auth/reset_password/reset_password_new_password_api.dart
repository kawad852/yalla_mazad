import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:yalla_mazad/model/auth/reset_password/reset_password_new_password_model.dart';
import 'package:yalla_mazad/utils/api_url.dart';

class ResetPasswordNewPasswordApi {
  Future<ResetPasswordNewPasswordModel?> data({
    required String phone,
    required String password,
  }) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.forgotPasswordChange}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
      };
      var body = jsonEncode({
        "phone": '+962$phone',
        "password": password,
      });
      log("Response:: resetPasswordNewPasswordResponse\nUrl:: $url\nheaders:: $headers\nbody:: $body");
      http.Response response =
          await http.post(uri, body: body, headers: headers);
      log("resetPasswordNewPasswordStatusCode:: ${response.statusCode}  resetPasswordNewPasswordBody:: ${response.body}");
      ResetPasswordNewPasswordModel resetPasswordNewPasswordModel =
          ResetPasswordNewPasswordModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return resetPasswordNewPasswordModel;
      } else if (response.statusCode == 500) {
        return resetPasswordNewPasswordModel;
      } else {
        throw "resetPasswordNewPassword Error";
      }
    } catch (e) {
      log("resetPasswordNewPassword Error $e");
      return null;
    }
  }
}
