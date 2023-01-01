import 'package:get/get.dart';
import 'package:yalla_mazad/controller/auctions/current_auction_controller.dart';

class CurrentAuctionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CurrentAuctionController());
  }
}
