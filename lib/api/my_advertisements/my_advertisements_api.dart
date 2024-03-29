import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:developer';

import 'package:yalla_mazad/model/my_advertisements/my_advertisements_model.dart';

import '../../utils/api_url.dart';
import '../../utils/shared_prefrences.dart';

class MyAdvertisementsApi {
  Future<MyAdvertisementsModel?> data() async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.fetchMyAds}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
        'x-localization': MySharedPreferences.language,
      };
      log("Response:: MyAdvertisementsResponse\nUrl:: $url\nheaders:: $headers\n");
      http.Response response = await http.get(uri, headers: headers);
      log("MyAdvertisementsStatusCode:: ${response.statusCode}  MyAdvertisementsBody:: ${response.body}");
      MyAdvertisementsModel myAdvertisementsModel =
          MyAdvertisementsModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return myAdvertisementsModel;
      } else if (response.statusCode == 500) {
        return myAdvertisementsModel;
      } else {
        throw "get myAdvertisements Error";
      }
    } catch (e) {
      log("get myAdvertisements Error $e");
      return null;
    }
  }
}
