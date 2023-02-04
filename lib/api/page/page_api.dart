import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:yalla_mazad/model/page/page_model.dart';

import '../../utils/api_url.dart';
import '../../utils/shared_prefrences.dart';

class PageApi {
  Future<PageModel?> data({required int id}) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.fetchPage}$id';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        'x-localization': MySharedPreferences.language,
      };
      log("Response:: PageResponse\nUrl:: $url\nheaders:: $headers\n");
      http.Response response = await http.get(uri, headers: headers);
      log("PageStatusCode:: ${response.statusCode}  PageBody:: ${response.body}");
      PageModel pageModel = PageModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return pageModel;
      } else if (response.statusCode == 500) {
        return pageModel;
      } else {
        throw "Page Error";
      }
    } catch (e) {
      log("Page Error $e");
      return null;
    }
  }
}
