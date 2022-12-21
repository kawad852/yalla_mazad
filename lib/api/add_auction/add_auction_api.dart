import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:yalla_mazad/utils/api_url.dart';

import 'package:path/path.dart';

import '../../model/add_auction/add_auction_model.dart';

class AddAuctionApi {
  Future<AddAuctionModel?> data({
    required File? file,
    required String? name,
    required String? content,
    required String? startPrice,
    required String? buyNowPrice,
    required int? userId,
    required int? categoryId,
  }) async {
    try {
      http.MultipartFile? multipartFile;
      if (file != null) {
        var stream = http.ByteStream(file.openRead());
        var length = await file.length();
        multipartFile = http.MultipartFile('images', stream, length,
            filename: basename(file.path));
      }
      String url = '${ApiUrl.mainUrl}${ApiUrl.addAuction}';
      Uri uri = Uri.parse(url);
      var request = http.MultipartRequest('POST', uri);
      var headers = {
        'Content-Type': 'application/json',
      };
      request.headers.addAll(headers);
      request.fields['name'] = name!;
      request.fields['content'] = content!;
      request.fields['start_price'] = startPrice!;
      request.fields['status'] = 'pending';
      request.fields['buy_now_price'] = buyNowPrice!;
      request.fields['user_id'] = userId.toString();
      request.fields['category_id'] = categoryId.toString();
      if (multipartFile != null) {
        request.files.add(multipartFile);
      }
      var response = await request.send();
      log("Response:: AddAuctionResponse\nUrl:: $url\nheaders:: $headers\n");

      if (response.statusCode == 200) {
        var responseData = await response.stream.toBytes();
        var responseString = String.fromCharCodes(responseData);
        var jsonData = jsonDecode(responseString);
        AddAuctionModel addAuctionModel = AddAuctionModel.fromJson(jsonData);
        log("AddAuctionStatusCode:: ${response.statusCode}  AddAuctionBody:: $jsonData");

        return addAuctionModel;
      } else {
        throw "add auction Error";
      }
    } catch (e) {
      log("add auction Error $e");
      return null;
    }
  }
}
