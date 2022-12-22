import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:developer';

import 'package:yalla_mazad/model/my_subscription/my_subscription_model.dart';

import '../../utils/api_url.dart';

class MySubscriptionApi {
  Future<MySubscriptionModel?> data({required int userId}) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.fetchMySubscription}$userId';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
      };
      log("Response:: MySubscriptionResponse\nUrl:: $url\nheaders:: $headers\n");
      http.Response response = await http.get(uri, headers: headers);
      log("MySubscriptionStatusCode:: ${response.statusCode}  MySubscriptionBody:: ${response.body}");
      MySubscriptionModel mySubscriptionModel =
          MySubscriptionModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return mySubscriptionModel;
      } else if (response.statusCode == 500) {
        return mySubscriptionModel;
      } else {
        throw "get mySubscription Error";
      }
    } catch (e) {
      log("get mySubscription Error $e");
      return null;
    }
  }
}
