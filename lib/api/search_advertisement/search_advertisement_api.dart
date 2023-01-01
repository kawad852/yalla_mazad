import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:yalla_mazad/model/search_advertisement/search_advertisement_model.dart';
import 'package:yalla_mazad/utils/api_url.dart';

class SearchAdvertisementApi {
  Future<SearchAdvertisementModel?> data({
    required String name,
  }) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.searchAdvertisement}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
      };
      var body = jsonEncode({
        "name": name,
      });
      log("Response:: searchAdvertisementResponse\nUrl:: $url\nheaders:: $headers\nbody:: $body");
      http.Response response =
          await http.post(uri, body: body, headers: headers);
      log("searchAdvertisementStatusCode:: ${response.statusCode}  searchAdvertisementBody:: ${response.body}");
      SearchAdvertisementModel searchAdvertisementModel =
          SearchAdvertisementModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return searchAdvertisementModel;
      } else if (response.statusCode == 500) {
        return searchAdvertisementModel;
      } else {
        throw "searchAdvertisement Error";
      }
    } catch (e) {
      log("searchAdvertisement Error $e");
      return null;
    }
  }
}
