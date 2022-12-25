import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:developer';

import 'package:yalla_mazad/model/introduction/introduction_model.dart';

import '../../utils/api_url.dart';

class IntroductionApi {
  Future<IntroductionModel?> data() async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.introduction}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
      };
      log("Response:: IntroductionResponse\nUrl:: $url\nheaders:: $headers\n");
      http.Response response = await http.get(uri, headers: headers);
      log("IntroductionStatusCode:: ${response.statusCode}  IntroductionBody:: ${response.body}");
      IntroductionModel introductionModel =
          IntroductionModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return introductionModel;
      } else if (response.statusCode == 500) {
        return introductionModel;
      } else {
        throw "get introduction Error";
      }
    } catch (e) {
      log("get introduction Error $e");
      return null;
    }
  }
}
