import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:yalla_mazad/utils/api_url.dart';

import 'package:path/path.dart';

import '../../model/add_auction/add_auction_model.dart';
import '../../utils/shared_prefrences.dart';

class AddAuctionApi {
  Future<AddAuctionModel?> data({
    required List<File?>? file,
    required String? name,
    required String? content,
    required String? startPrice,
    required String? buyNowPrice,
    required int? userId,
    required String? categoryId,
  }) async {
    try {
      http.MultipartFile? multipartFile;
      List<http.MultipartFile?> multipartFiles = [];
      if (file != null) {
        for (var item in file) {
          if (item != null) {
            // log('paath::::::    ${item.path}');
            var stream = http.ByteStream(item.openRead());
            var length = await item.length();
            multipartFile = http.MultipartFile("images[]", stream, length,
                filename: basename(item.path));
            multipartFiles.add(multipartFile);
            // request.files.add(multipartFile);
          }
        }
      }
      String url = '${ApiUrl.mainUrl}${ApiUrl.addAuction}';
      Uri uri = Uri.parse(url);
      var request = http.MultipartRequest('POST', uri);
      var headers = {
        'Content-Type': 'application/json',
        'x-localization': MySharedPreferences.language,
      };
      request.headers.addAll(headers);
      for (var item in multipartFiles) {
        if (item != null) {
          // log('added:::::   ${item.filename}');
          request.files.add(item);
        }
      }
      // log(request.files.length.toString());
      request.fields['name'] = name!;
      request.fields['content'] = content!;
      request.fields['start_price'] = startPrice!;
      request.fields['status'] = 'pending';
      request.fields['buy_now_price'] = buyNowPrice!;
      request.fields['user_id'] = userId.toString();
      request.fields['category_id'] = categoryId!;

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
