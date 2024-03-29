import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:developer';

import '../../model/all_advertisements/all_advertiements_model.dart';
import '../../utils/api_url.dart';
import '../../utils/shared_prefrences.dart';

class ALlAdvertisementsApi {
  Future<AllAdvertisementsModel?> data(int pageId) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.fetchAllAds}?page=$pageId';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
        'x-localization': MySharedPreferences.language,
      };
      log("Response:: AllAdvertisementsResponse\nUrl:: $url\nheaders:: $headers\n");
      http.Response response = await http.get(uri, headers: headers);
      log("AllAdvertisementsStatusCode:: ${response.statusCode}  AllAdvertisementsBody:: ${response.body}");
      AllAdvertisementsModel allAdvertisementsModel =
          AllAdvertisementsModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return allAdvertisementsModel;
      } else if (response.statusCode == 500) {
        return allAdvertisementsModel;
      } else {
        throw "get AllAdvertisements Error";
      }
    } catch (e) {
      log("get AllAdvertisements Error $e");
      return null;
    }
  }
}
