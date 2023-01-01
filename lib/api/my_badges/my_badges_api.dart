import 'package:http/http.dart' as http;
import 'package:yalla_mazad/model/my_badges/my_badges_model.dart';

import 'dart:convert';
import 'dart:developer';

import '../../utils/api_url.dart';
import '../../utils/shared_prefrences.dart';

class MyBadgesApi {
  Future<MyBadgesModel?> data() async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.fetchMyBadges}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
      };
      log("Response:: myBadgesResponse\nUrl:: $url\nheaders:: $headers\n");
      http.Response response = await http.get(uri, headers: headers);
      log("myBadgesStatusCode:: ${response.statusCode}  myBadgesBody:: ${response.body}");
      MyBadgesModel myBadgesModel =
          MyBadgesModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return myBadgesModel;
      } else if (response.statusCode == 500) {
        return myBadgesModel;
      } else {
        throw "myBadges Error";
      }
    } catch (e) {
      log("myBadges Error $e");
      return null;
    }
  }
}
