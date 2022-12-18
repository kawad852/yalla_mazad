import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:yalla_mazad/model/auth/update_user_phone_model.dart';
import 'package:yalla_mazad/utils/api_url.dart';

class UpdateUserPhoneApi {
  Future<UpdateUserPhoneModel?> data(
      {required String phone, required int id}) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.updateUserPhone}$id';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
      };
      var body = jsonEncode({
        "phone": '+962$phone',
      });
      log("Response:: UpdateUserPhoneResponse\nUrl:: $url\nheaders:: $headers\nbody:: $body");
      http.Response response =
          await http.post(uri, body: body, headers: headers);
      log("UpdateUserPhoneStatusCode:: ${response.statusCode}  UpdateUserPhoneBody:: ${response.body}");
      UpdateUserPhoneModel updateUserPhoneModel =
          UpdateUserPhoneModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return updateUserPhoneModel;
      } else if (response.statusCode == 500) {
        return updateUserPhoneModel;
      } else {
        throw "update user phone Error";
      }
    } catch (e) {
      log("update user phone Error $e");
      return null;
    }
  }
}
