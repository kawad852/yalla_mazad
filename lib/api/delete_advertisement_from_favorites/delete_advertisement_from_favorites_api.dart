import 'package:http/http.dart' as http;
import 'package:yalla_mazad/model/delete_advertisement_from_favorites/delete_advertisement_from_favorites_model.dart';

import 'dart:convert';
import 'dart:developer';

import '../../utils/api_url.dart';
import '../../utils/shared_prefrences.dart';

class DeleteAdvertisementFromFavoritesApi {
  Future<DeleteAdvertisementFromFavoritesModel?> data({
    required String userId,
    required String advertisementId,
  }) async {
    try {
      String url =
          '${ApiUrl.mainUrl}${ApiUrl.deleteAdvertisementFromFavorites}$advertisementId/$userId';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        'x-localization': MySharedPreferences.language,
      };
      log("Response:: DeleteAdvertisementFromFavoritesResponse\nUrl:: $url\nheaders:: $headers\n");
      http.Response response = await http.get(uri, headers: headers);
      log("DeleteAdvertisementFromFavoritesStatusCode:: ${response.statusCode}  DeleteAdvertisementFromFavoritesBody:: ${response.body}");
      DeleteAdvertisementFromFavoritesModel
          deleteAdvertisementFromFavoritesModel =
          DeleteAdvertisementFromFavoritesModel.fromJson(
              json.decode(response.body));
      if (response.statusCode == 200) {
        return deleteAdvertisementFromFavoritesModel;
      } else if (response.statusCode == 500) {
        return deleteAdvertisementFromFavoritesModel;
      } else {
        throw "deleteAdvertisementFromFavoritesModel Error";
      }
    } catch (e) {
      log("deleteAdvertisementFromFavoritesModel Error $e");
      return null;
    }
  }
}
