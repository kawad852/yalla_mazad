import 'package:get/get.dart';

import '../../controller/home/view_auctions/view_auction_controller.dart';

class ViewAuctionBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => ViewAuctionController());
  }

}