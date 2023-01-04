import 'package:http/http.dart' as http;
import 'package:yalla_mazad/model/advertisement_by_category/advertisement_by_category_model.dart';

import 'dart:convert';
import 'dart:developer';

import '../../utils/api_url.dart';
import '../../utils/shared_prefrences.dart';

class AdvertisementByCategoryApi {
  Future<AdvertisementByCategoryModel?> data({required int categoryId}) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.fetchAdsByCategory}$categoryId';
      Uri uri = Uri.parse(url);

      ///TODO: make sure from backend (ask)
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
      };
      log("Response:: AdvertisementByCategoryResponse\nUrl:: $url\nheaders:: $headers\n");
      http.Response response = await http.get(uri, headers: headers);
      log("AdvertisementByCategoryStatusCode:: ${response.statusCode}  AdvertisementByCategoryBody:: ${response.body}");
      AdvertisementByCategoryModel advertisementByCategoryModel =
          AdvertisementByCategoryModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return advertisementByCategoryModel;
      } else if (response.statusCode == 500) {
        return advertisementByCategoryModel;
      } else {
        throw "get AdvertisementByCategory Error";
      }
    } catch (e) {
      log("get AdvertisementByCategory Error $e");
      return null;
    }
  }
}
