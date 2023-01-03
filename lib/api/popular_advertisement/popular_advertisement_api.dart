import 'package:http/http.dart' as http;
import 'package:yalla_mazad/model/popular_advertisement/popular_advertisement_model.dart';

import 'dart:convert';
import 'dart:developer';

import '../../utils/api_url.dart';

class PopularAdsApi {
  Future<PopularAdvertisementModel?> data(int pageId) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.fetchAllPopularAds}?page=$pageId';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
      };
      log("Response:: PopularAdsResponse\nUrl:: $url\nheaders:: $headers\n");
      http.Response response = await http.get(uri, headers: headers);
      log("PopularAdsStatusCode:: ${response.statusCode}  PopularAdsBody:: ${response.body}");
      PopularAdvertisementModel popularAdvertisementModel =
          PopularAdvertisementModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return popularAdvertisementModel;
      } else if (response.statusCode == 500) {
        return popularAdvertisementModel;
      } else {
        throw "get popular ads Error";
      }
    } catch (e) {
      log("get popular ads Error $e");
      return null;
    }
  }
}
