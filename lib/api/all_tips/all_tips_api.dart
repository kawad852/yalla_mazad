import 'package:http/http.dart' as http;
import 'package:yalla_mazad/model/all_tips/all_tips_model.dart';

import 'dart:convert';
import 'dart:developer';

import '../../utils/api_url.dart';
import '../../utils/shared_prefrences.dart';

class AllTipsApi {
  Future<AllTipsModel?> data() async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.fetchAllTips}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        'x-localization': MySharedPreferences.language,
      };
      log("Response:: allTipsResponse\nUrl:: $url\nheaders:: $headers\n");
      http.Response response = await http.get(uri, headers: headers);
      log("allTipsStatusCode:: ${response.statusCode}  allTipsBody:: ${response.body}");
      AllTipsModel allTipsModel =
          AllTipsModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return allTipsModel;
      } else if (response.statusCode == 500) {
        return allTipsModel;
      } else {
        throw "allTips Error";
      }
    } catch (e) {
      log("allTips Error $e");
      return null;
    }
  }
}
