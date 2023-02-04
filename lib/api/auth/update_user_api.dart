import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:yalla_mazad/utils/api_url.dart';

import '../../model/auth/update_user_model.dart';
import '../../utils/shared_prefrences.dart';

class UpdateUserApi {
  Future<UpdateUserModel?> data({
    required String phone,
  }) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.updateUser}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
      };
      var body = jsonEncode({
        "phone": '+962$phone',
      });
      log("Response:: UpdateUserResponse\nUrl:: $url\nheaders:: $headers\nbody:: $body");
      http.Response response =
          await http.post(uri, body: body, headers: headers);
      log("UpdateUserStatusCode:: ${response.statusCode}  UpdateUserBody:: ${response.body}");
      UpdateUserModel updateUserModel =
          UpdateUserModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return updateUserModel;
      } else if (response.statusCode == 500) {
        return updateUserModel;
      } else {
        throw "update user Error";
      }
    } catch (e) {
      log("update user Error $e");
      return null;
    }
  }
}
