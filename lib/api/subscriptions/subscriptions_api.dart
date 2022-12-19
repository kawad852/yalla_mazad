// import 'package:http/http.dart' as http;
//
// import 'dart:convert';
// import 'dart:developer';
//
// import '../../model/subscriptions/subscriptions_model.dart';
// import '../../utils/api_url.dart';
//
// class SubscriptionApi {
//   Future<SubscriptionsModel?> data() async {
//     try {
//       String url = '${ApiUrl.mainUrl}${ApiUrl.fetchAllSubscriptions}';
//       Uri uri = Uri.parse(url);
//       var headers = {
//         'Content-Type': 'application/json',
//         // 'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
//       };
//       log("Response:: SubscriptionResponse\nUrl:: $url\nheaders:: $headers\n");
//       http.Response response = await http.get(uri, headers: headers);
//       log("SubscriptionStatusCode:: ${response.statusCode}  SubscriptionBody:: ${response.body}");
//       SubscriptionsModel subscriptionModel =
//           SubscriptionsModel.fromJson(json.decode(response.body));
//       if (response.statusCode == 200) {
//         return subscriptionModel;
//       } else if (response.statusCode == 500) {
//         return subscriptionModel;
//       } else {
//         throw "get subscriptions Error";
//       }
//     } catch (e) {
//       log("get subscriptions Error $e");
//       return null;
//     }
//   }
// }
