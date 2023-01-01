import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:yalla_mazad/model/add_advertisement_to_favorites/add_advertisement_to_favorites_model.dart';
import 'package:yalla_mazad/utils/api_url.dart';

class AddAdvertisementToFavoritesApi {
  Future<AddAdvertisementToFavoritesModel?> data({
    required String userId,
    required String advertisementId,
  }) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.addAdvertisementToFavorites}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
      };
      var body = jsonEncode({
        "user_id": userId,
        "advertisement_id": advertisementId,
      });
      log("Response:: AddAdvertisementToFavoritesResponse\nUrl:: $url\nheaders:: $headers\nbody:: $body");
      http.Response response =
          await http.post(uri, body: body, headers: headers);
      log("AddAdvertisementToFavoritesStatusCode:: ${response.statusCode}  AddAdvertisementToFavoritesBody:: ${response.body}");
      AddAdvertisementToFavoritesModel addAdvertisementToFavoritesModel =
          AddAdvertisementToFavoritesModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return addAdvertisementToFavoritesModel;
      } else if (response.statusCode == 500) {
        return addAdvertisementToFavoritesModel;
      } else {
        throw "addAdvertisementToFavoritesModel Error";
      }
    } catch (e) {
      log("addAdvertisementToFavoritesModel Error $e");
      return null;
    }
  }
}
