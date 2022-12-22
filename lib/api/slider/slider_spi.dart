import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:developer';

import 'package:yalla_mazad/model/slider/slider_model.dart';

import '../../utils/api_url.dart';

class SliderApi {
  Future<SliderModel?> data() async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.fetchAllSliders}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
      };
      log("Response:: SliderResponse\nUrl:: $url\nheaders:: $headers\n");
      http.Response response = await http.get(uri, headers: headers);
      log("SliderStatusCode:: ${response.statusCode}  SliderBody:: ${response.body}");
      SliderModel sliderModel =
          SliderModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return sliderModel;
      } else if (response.statusCode == 500) {
        return sliderModel;
      } else {
        throw "get slider Error";
      }
    } catch (e) {
      log("get slider Error $e");
      return null;
    }
  }
}
