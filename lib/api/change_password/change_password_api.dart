import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:yalla_mazad/model/change_password/change_password_model.dart';
import 'package:yalla_mazad/utils/api_url.dart';

import '../../utils/shared_prefrences.dart';

class ChangePasswordApi {
  Future<ChangePasswordModel?> data({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.changePassword}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
      };
      var body = jsonEncode({
        "old_password": oldPassword,
        "new_password": newPassword,
      });
      log("Response:: ChangePasswordResponse\nUrl:: $url\nheaders:: $headers\nbody:: $body");
      http.Response response =
          await http.post(uri, body: body, headers: headers);
      log("ChangePasswordStatusCode:: ${response.statusCode}  ChangePasswordBody:: ${response.body}");
      ChangePasswordModel changePasswordModel =
          ChangePasswordModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return changePasswordModel;
      } else if (response.statusCode == 500) {
        return changePasswordModel;
      } else {
        throw "ChangePassword Error";
      }
    } catch (e) {
      log("ChangePassword Error $e");
      return null;
    }
  }
}
