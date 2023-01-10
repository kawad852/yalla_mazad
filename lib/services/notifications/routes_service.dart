// import 'dart:developer';
//
// import 'package:get/get.dart';
//
//
// class RoutesService {
//   void toggle(Map<String, dynamic> notificationsMap) {
//     try {
//       var data = NotificationsModel.fromJson(notificationsMap);
//       switch (data.route) {
//         case BaseRoutes.restaurant:
//           Get.to(
//             () => ViewRestaurantScreen(
//               restaurantId: data.restaurantId!,
//               title: data.title!,
//               cost: data.cost!,
//               time: data.time!,
//               reviewIcon: data.reviewIcon!,
//               cover: data.cover!,
//               logo: data.logo!,
//               review: data.review!,
//               phone: data.phone!,
//             ),
//             binding: ProductBinding(id: data.restaurantId!),
//           );
//           break;
//         case BaseRoutes.product:
//           Get.to(
//             () => ViewRestaurantScreen(
//               restaurantId: data.restaurantId!,
//               title: data.title!,
//               cost: data.cost!,
//               time: data.time!,
//               reviewIcon: data.reviewIcon!,
//               cover: data.cover!,
//               logo: data.logo!,
//               review: data.review!,
//               phone: data.phone!,
//             ),
//             binding: ProductBinding(id: data.restaurantId!),
//           );
//           Get.to(
//             () => ViewRestaurantProductScreen(
//               restaurantId: data.restaurantId!,
//               productId: data.productId!,
//               title: data.title!,
//               description: data.description!,
//               price: data.price!,
//               cover: "img/restaurants/mcdonald-s.png",
//               groups: List<ProductGroups>.from(data.groups!.map((x) => ProductGroups.fromJson(x))),
//             ),
//             binding: ViewProductBinding(),
//           );
//           break;
//         case BaseRoutes.order:
//           Get.to(() => OrderStatusScreen(orderId: data.orderId!, route: kBack));
//           break;
//         default:
//           {
//             break;
//           }
//       }
//     } catch (e) {
//       log("RouteError:: $e");
//     }
//   }
// }
