import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:yalla_mazad/model/auth/resend_otp_model.dart';
import 'package:yalla_mazad/utils/api_url.dart';

import '../../utils/shared_prefrences.dart';

class ResendOtpApi {
  Future<ResendOtpModel?> data({
    required int id,
  }) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.resendOtp}$id';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
      };
      log("Response:: ResendOtpResponse\nUrl:: $url\nheaders:: $headers\n");
      http.Response response = await http.get(uri, headers: headers);
      log("ResendOtpStatusCode:: ${response.statusCode}  ResendOtpBody:: ${response.body}");
      ResendOtpModel resendOtpModel =
          ResendOtpModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return resendOtpModel;
      } else if (response.statusCode == 500) {
        return resendOtpModel;
      } else {
        throw "resend otp Error";
      }
    } catch (e) {
      log("resend otp Error $e");
      return null;
    }
  }
}
