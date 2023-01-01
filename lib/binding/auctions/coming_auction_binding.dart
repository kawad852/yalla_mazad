import 'package:get/get.dart';
import 'package:yalla_mazad/controller/auctions/coming_auction_controller.dart';

class ComingAuctionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ComingAuctionController());
  }
}
