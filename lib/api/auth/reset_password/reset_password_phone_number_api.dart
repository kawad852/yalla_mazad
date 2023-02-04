import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:yalla_mazad/model/auth/reset_password/reset_password_phone_number_model.dart';
import 'package:yalla_mazad/utils/api_url.dart';

class ResetPasswordPhoneNumberApi {
  Future<ResetPasswordPhoneNumberModel?> data({
    required String phone,
  }) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.forgotPasswordOtp}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
      };
      var body = jsonEncode({
        "phone": '+962$phone',
      });
      log("Response:: resetPasswordPhoneNumberResponse\nUrl:: $url\nheaders:: $headers\nbody:: $body");
      http.Response response =
          await http.post(uri, body: body, headers: headers);
      log("resetPasswordPhoneNumberStatusCode:: ${response.statusCode}  resetPasswordPhoneNumberBody:: ${response.body}");
      ResetPasswordPhoneNumberModel resetPasswordPhoneNumberModel =
          ResetPasswordPhoneNumberModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return resetPasswordPhoneNumberModel;
      } else if (response.statusCode == 500) {
        return resetPasswordPhoneNumberModel;
      } else {
        throw "resetPasswordPhoneNumber Error";
      }
    } catch (e) {
      log("resetPasswordPhoneNumber Error $e");
      return null;
    }
  }
}
