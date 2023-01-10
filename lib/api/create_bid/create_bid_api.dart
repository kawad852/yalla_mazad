import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:yalla_mazad/model/create_bid/create_bid_model.dart';
import 'package:yalla_mazad/utils/api_url.dart';

class CreateBidApi {
  Future<CreateBidModel?> data({
    required String? price,
    required String? userId,
    required String? adId,
  }) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.createBid}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
      };
      var body = jsonEncode({
        "price": price,
        "user_id": userId,
        "advertisement_id": adId,
      });
      log("Response:: CreateBidResponse\nUrl:: $url\nheaders:: $headers\nbody:: $body");
      http.Response response =
          await http.post(uri, body: body, headers: headers);
      log("CreateBidStatusCode:: ${response.statusCode}  CreateBidBody:: ${response.body}");
      CreateBidModel createBidModel =
          CreateBidModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return createBidModel;
      } else if (response.statusCode == 500) {
        return createBidModel;
      } else {
        throw "CreateBid Error";
      }
    } catch (e) {
      log("CreateBid Error $e");
      return null;
    }
  }
}
