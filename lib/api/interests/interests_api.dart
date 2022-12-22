import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:developer';

import 'package:yalla_mazad/model/interests/interests_model.dart';

import '../../utils/api_url.dart';

class InterestsApi {
  Future<InterestsModel?> data() async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.fetchAllInterests}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
      };
      log("Response:: InterestsResponse\nUrl:: $url\nheaders:: $headers\n");
      http.Response response = await http.get(uri, headers: headers);
      log("InterestsStatusCode:: ${response.statusCode}  InterestsBody:: ${response.body}");
      InterestsModel interestsModel =
          InterestsModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return interestsModel;
      } else if (response.statusCode == 500) {
        return interestsModel;
      } else {
        throw "get interests Error";
      }
    } catch (e) {
      log("get interests Error $e");
      return null;
    }
  }
}
