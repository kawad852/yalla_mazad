import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:yalla_mazad/utils/api_url.dart';

import '../../model/auth/update_user_model.dart';
import '../../utils/shared_prefrences.dart';

class UpdateUserImageApi {
  Future<UpdateUserModel?> data({
    required File? file,
  }) async {
    try {
      http.MultipartFile? multipartFile;
      if (file != null) {
        var stream = http.ByteStream(file.openRead());
        var length = await file.length();
        multipartFile = http.MultipartFile("image", stream, length,
            filename: basename(file.path));
      }
      String url = '${ApiUrl.mainUrl}${ApiUrl.updateUser}';
      Uri uri = Uri.parse(url);
      var request = http.MultipartRequest('POST', uri);
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
      };
      request.headers.addAll(headers);
      if (multipartFile != null) {
        request.files.add(multipartFile);
      }
      var response = await request.send();
      log("Response:: UpdateUserResponse\nUrl:: $url\nheaders:: $headers\n");

      if (response.statusCode == 200) {
        var responseData = await response.stream.toBytes();
        var responseString = String.fromCharCodes(responseData);
        var jsonData = jsonDecode(responseString);
        UpdateUserModel updateUserModel = UpdateUserModel.fromJson(jsonData);
        log("UpdateUserStatusCode:: ${response.statusCode}  UpdateUserBody:: $jsonData");
        return updateUserModel;
      } else {
        throw "update user Error";
      }
    } catch (e) {
      log("update user Error $e");
      return null;
    }
  }
}
