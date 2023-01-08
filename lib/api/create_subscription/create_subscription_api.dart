import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:yalla_mazad/model/create_subscription/create_subscription_model.dart';
import 'package:yalla_mazad/utils/api_url.dart';

import '../../model/auth/sign_in_model.dart';

class CreateSubscriptionApi {
  Future<CreateSubscriptionModel?> data({
    required String userId,
    required String planId,
    required String startDate,
    required String endDate,
  }) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.createSubscription}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
      };
      var body = jsonEncode({
        "user_id": userId,
        "plan_id": planId,
        "start_date": startDate,
        "end_date": endDate,
      });
      log("Response:: CreateSubscriptionResponse\nUrl:: $url\nheaders:: $headers\nbody:: $body");
      http.Response response =
          await http.post(uri, body: body, headers: headers);
      log("CreateSubscriptionStatusCode:: ${response.statusCode}  CreateSubscriptionBody:: ${response.body}");
      CreateSubscriptionModel createSubscriptionModel =
          CreateSubscriptionModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return createSubscriptionModel;
      } else if (response.statusCode == 500) {
        return createSubscriptionModel;
      } else {
        throw "CreateSubscription Error";
      }
    } catch (e) {
      log("CreateSubscription Error $e");
      return null;
    }
  }
}
