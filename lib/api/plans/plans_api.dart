import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:developer';

import '../../model/plans/plans_model.dart';
import '../../utils/api_url.dart';
import '../../utils/shared_prefrences.dart';

class PlansApi {
  Future<PlansModel?> data() async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.fetchAllPlans}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        'x-localization':MySharedPreferences.language,
      };
      log("Response:: PlansResponse\nUrl:: $url\nheaders:: $headers\n");
      http.Response response = await http.get(uri, headers: headers);
      log("PlansStatusCode:: ${response.statusCode}  PlansBody:: ${response.body}");
      PlansModel plansModel = PlansModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return plansModel;
      } else if (response.statusCode == 500) {
        return plansModel;
      } else {
        throw "get plans Error";
      }
    } catch (e) {
      log("get plans Error $e");
      return null;
    }
  }
}
