import 'package:get/get.dart';
import 'package:yalla_mazad/controller/home/auctions/auctions_by_category_controller.dart';

class AuctionsByCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuctionsByCategoryController());
  }
}
