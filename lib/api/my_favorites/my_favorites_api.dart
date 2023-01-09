import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:developer';

import 'package:yalla_mazad/model/my_favorites/my_favorites_model.dart';

import '../../utils/api_url.dart';
import '../../utils/shared_prefrences.dart';

class MyFavoritesApi {
  Future<MyFavoritesModel?> data() async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.fetchMyFavorites}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
        'x-localization': MySharedPreferences.language,
      };
      log("Response:: MyFavoritesResponse\nUrl:: $url\nheaders:: $headers\n");
      http.Response response = await http.get(uri, headers: headers);
      log("MyFavoritesStatusCode:: ${response.statusCode}  MyFavoritesBody:: ${response.body}");
      MyFavoritesModel myFavoritesModel =
          MyFavoritesModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return myFavoritesModel;
      } else if (response.statusCode == 500) {
        return myFavoritesModel;
      } else {
        throw "get myFavorites Error";
      }
    } catch (e) {
      log("get myFavorites Error $e");
      return null;
    }
  }
}
