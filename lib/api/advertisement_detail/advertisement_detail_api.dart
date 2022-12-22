import 'package:http/http.dart' as http;
import 'package:yalla_mazad/model/advertisement_details/advertisement_details_model.dart';

import 'dart:convert';
import 'dart:developer';

import '../../utils/api_url.dart';

class AdvertisementDetailsApi {
  Future<AdvertisementDetailsModel?> data({required int adId}) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.fetchAdDetails}$adId';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
      };
      log("Response:: AdvertisementDetailsResponse\nUrl:: $url\nheaders:: $headers\n");
      http.Response response = await http.get(uri, headers: headers);
      log("AdvertisementDetailsStatusCode:: ${response.statusCode}  AdvertisementDetailsBody:: ${response.body}");
      AdvertisementDetailsModel advertisementDetailsModel =
          AdvertisementDetailsModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return advertisementDetailsModel;
      } else if (response.statusCode == 500) {
        return advertisementDetailsModel;
      } else {
        throw "get advertisementDetails Error";
      }
    } catch (e) {
      log("get advertisementDetails Error $e");
      return null;
    }
  }
}
