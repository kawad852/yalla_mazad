import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:yalla_mazad/model/auth/opt_check_model.dart';
import 'package:yalla_mazad/utils/api_url.dart';

class OptCheckApi {
  Future<OptCheckModel?> data({
    required String phone,
    required String code,
  }) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.otpCheck}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
      };
      var body = jsonEncode({
        "phone": '+962$phone',
        "code": code,
      });
      log("Response:: OptCheckResponse\nUrl:: $url\nheaders:: $headers\nbody:: $body");
      http.Response response =
          await http.post(uri, body: body, headers: headers);
      log("OptCheckStatusCode:: ${response.statusCode}  OptCheckBody:: ${response.body}");
      OptCheckModel optCheckModel =
          OptCheckModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return optCheckModel;
      } else if (response.statusCode == 500) {
        return optCheckModel;
      } else {
        throw "opt check Error";
      }
    } catch (e) {
      log("opt check Error $e");
      return null;
    }
  }
}
