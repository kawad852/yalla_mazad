import 'package:http/http.dart' as http;
import 'package:yalla_mazad/model/my_notifications/my_notifications_model.dart';

import 'dart:convert';
import 'dart:developer';

import '../../utils/api_url.dart';
import '../../utils/shared_prefrences.dart';

class MyNotificationsApi {
  Future<MyNotificationsModel?> data() async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.fetchMyNotifications}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
        'x-localization':MySharedPreferences.language,
      };
      log("Response::MyNotificationsResponse\nUrl:: $url\nheaders:: $headers\n");
      http.Response response = await http.get(uri, headers: headers);
      log("MyNotificationsStatusCode:: ${response.statusCode}  MyNotificationsBody:: ${response.body}");
      MyNotificationsModel myNotificationsModel =
          MyNotificationsModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return myNotificationsModel;
      } else if (response.statusCode == 500) {
        return myNotificationsModel;
      } else {
        throw "MyNotifications Error";
      }
    } catch (e) {
      log("MyNotifications Error $e");
      return null;
    }
  }
}
