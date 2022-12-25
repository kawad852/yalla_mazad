import 'package:get/get.dart';
import 'package:yalla_mazad/controller/add_auction/add_auction_controller.dart';

class AddAuctionBinding extends Bindings {
  @override
  void dependencies() {
    ///TODO:maybe delete it, but i need to make sure of the flow
    Get.lazyPut(() => AddAuctionController());
  }
}
