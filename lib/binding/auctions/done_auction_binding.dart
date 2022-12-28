import 'package:get/get.dart';

import '../../controller/auctions/done_auction_controller.dart';

class DoneAuctionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DoneAuctionController());
  }
}
