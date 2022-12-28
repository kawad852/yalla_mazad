import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:yalla_mazad/model/add_categories_to_user/add_categories_to_user_model.dart';
import 'package:yalla_mazad/utils/api_url.dart';

class AddCategoriesToUserApi {
  Future<AddCategoriesToUserModel?> data({
    required String userId,
    required List<String> categoriesId,
  }) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.addCategoriesToUser}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
      };
      var body = jsonEncode({
        "user_id": userId,
        "cats": categoriesId,
      });
      log("Response:: addCategoriesToUserResponse\nUrl:: $url\nheaders:: $headers\nbody:: $body");
      http.Response response =
          await http.post(uri, body: body, headers: headers);
      log("addCategoriesToUserStatusCode:: ${response.statusCode}  addCategoriesToUserBody:: ${response.body}");
      AddCategoriesToUserModel addCategoriesToUserModel =
          AddCategoriesToUserModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return addCategoriesToUserModel;
      } else if (response.statusCode == 500) {
        return addCategoriesToUserModel;
      } else {
        throw "addCategoriesToUser Error";
      }
    } catch (e) {
      log("addCategoriesToUser Error $e");
      return null;
    }
  }
}
