// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:yalla_mazad/utils/api_url.dart';
//
// import 'package:path/path.dart';
// class AddAuctionApi {
//   Future<AddAuctionModel?> data({
//     File? file,
//   }) async {
//     try {
//       String url = '${ApiUrl.mainUrl}${ApiUrl.}';
//     Uri uri = Uri.parse(url);
//       http.MultipartFile? multipartFile ;
//       if(file!=null){
//        var stream = http.ByteStream(file.openRead());
//        var length = await file.length();
//        multipartFile = http.MultipartFile('images', stream, length,filename: basename(file.path));
//     }
//
//       var request = http.MultipartRequest('POST',uri);
//
//       var headers = {
//         'Content-Type': 'application/json',
//         // 'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
//       };
//       request.headers.addAll(headers);
//       request.fields['name']=name;
//       if(multipartFile!=null){
//     request.files.add(multipartFile);
//     }
//
//       log("Response:: AddAuctionResponse\nUrl:: $url\nheaders:: $headers\nbody:: $body");
//       http.Response response =
//       await http.post(uri, body: body, headers: headers);
//       log("AddAuctionStatusCode:: ${response.statusCode}  AddAuctionBody:: ${response.body}");
// AddAuctionModel addAuctionModel =
// AddAuctionModel.fromJson(json.decode(response.body));
//       if (response.statusCode == 200) {
//         return addAuctionModel;
//       } else if (response.statusCode == 500) {
//         return addAuctionModel;
//       } else {
//         throw "add auction Error";
//       }
//     } catch (e) {
//       log("add auction Error $e");
//       return null;
//     }
//   }
// }
