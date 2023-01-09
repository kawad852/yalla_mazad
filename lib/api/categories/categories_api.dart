import 'package:http/http.dart' as http;
import 'package:yalla_mazad/model/categories/categories_model.dart';

import 'dart:convert';
import 'dart:developer';

import '../../utils/api_url.dart';
import '../../utils/shared_prefrences.dart';

class CategoriesApi {
  Future<CategoriesModel?> data() async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.fetchAllCategories}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        'x-localization':MySharedPreferences.language,
      };
      log("Response:: CategoriesResponse\nUrl:: $url\nheaders:: $headers\n");
      http.Response response = await http.get(uri, headers: headers);
      log("CategoriesStatusCode:: ${response.statusCode}  CategoriesBody:: ${response.body}");
      CategoriesModel categoriesModel =
          CategoriesModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return categoriesModel;
      } else if (response.statusCode == 500) {
        return categoriesModel;
      } else {
        throw "get categories Error";
      }
    } catch (e) {
      log("get categories Error $e");
      return null;
    }
  }
}
