import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:yalla_mazad/utils/api_url.dart';
import 'package:yalla_mazad/utils/shared_prefrences.dart';

class DeviceTokenService {
  Future<void> updateDeviceToken(String token) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.deviceToken}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
      };
      var body = jsonEncode({
        'device_token': token,
      });
      log("Response:: updateDeviceTokenResponse\nUrl:: $url\nheaders:: $headers");
      http.Response response =
          await http.post(uri, body: body, headers: headers);
      log("updateDeviceTokenStatusCode:: ${response.statusCode} updateTokenBody:: ${response.body}");
    } catch (e) {
      log("deviceTokenError:: $e");
    }
  }
}
