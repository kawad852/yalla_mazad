// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:yalla_mazad/binding/auctions/coming_auction_binding.dart';
// import 'package:yalla_mazad/binding/auctions/current_auction_binding.dart';
// import 'package:yalla_mazad/binding/auctions/done_auction_binding.dart';
// import 'package:yalla_mazad/ui/screens/auctions/screens/coming_auction.dart';
// import 'package:yalla_mazad/ui/screens/auctions/screens/current_auction.dart';
// import 'package:yalla_mazad/ui/screens/auctions/screens/done_auction.dart';
// import 'package:yalla_mazad/ui/widgets/custom_network_image.dart';
// import '../../../../../utils/colors.dart';
//
// class ViewAuctionItem extends StatelessWidget {
//   final String image;
//   final String name;
//   final String user;
//   final String id;
//   final String startDate;
//   final String endDate;
//   const ViewAuctionItem({
//     required this.name,
//     required this.image,
//     required this.user,
//     required this.id,
//     required this.startDate,
//     required this.endDate,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.only(
//         top: 90,
//       ),
//       child: SizedBox(
//         height: Get.height,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const SizedBox(
//               height: 20,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 30.0,
//               ),
//               child: InkWell(
//                 onTap: () {
//                   log(startDate);
//                   log(endDate);
//                   int startDifference = DateTime.parse(startDate)
//                       .difference(DateTime.now())
//                       .inSeconds;
//                   int endDifference = DateTime.now()
//                       .difference(DateTime.parse(endDate))
//                       .inSeconds;
//                   if (startDifference >= 1) {
//                     log('coming');
//                     Get.to(
//                       () => const ComingAuctionScreen(),
//                       binding: ComingAuctionBinding(),
//                       arguments: id,
//                     );
//                   } else if (startDifference <= 0 && endDifference <= 0) {
//                     log('current');
//                     Get.to(
//                       () => const CurrentAuctionScreen(),
//                       binding: CurrentAuctionBinding(),
//                       arguments: id,
//                     );
//                   } else if (endDifference >= 1) {
//                     log('done');
//                     Get.to(
//                       () => const DoneAuctionScreen(),
//                       binding: DoneAuctionBinding(),
//                       arguments: id,
//                     );
//                   }
//                 },
//                 child: Container(
//                   height: 3 * MediaQuery.of(context).size.height / 5,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(
//                       25,
//                     ),
//                   ),
//                   child: CustomNetworkImage(
//                     radius: 25,
//                     url: image,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 40,
//             ),
//             InkWell(
//               onTap: () {
//                 int startDifference = DateTime.parse(startDate)
//                     .difference(DateTime.now())
//                     .inSeconds;
//                 int endDifference = DateTime.now()
//                     .difference(DateTime.parse(endDate))
//                     .inSeconds;
//                 if (startDifference >= 1) {
//                   Get.to(
//                     () => const ComingAuctionScreen(),
//                     binding: ComingAuctionBinding(),
//                     arguments: id,
//                   );
//                 } else if (startDifference <= 0 && endDifference <= 0) {
//                   Get.to(
//                     () => const CurrentAuctionScreen(),
//                     binding: CurrentAuctionBinding(),
//                     arguments: id,
//                   );
//                 } else if (endDifference >= 1) {
//                   Get.to(
//                     () => const DoneAuctionScreen(),
//                     binding: DoneAuctionBinding(),
//                     arguments: id,
//                   );
//                 }
//               },
//               child: Text(
//                 name,
//                 style: const TextStyle(
//                   color: MyColors.primary,
//                   fontSize: 22,
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Text(
//               user,
//               style: const TextStyle(
//                 color: Color(
//                   0xff333333,
//                 ),
//                 fontSize: 16,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
