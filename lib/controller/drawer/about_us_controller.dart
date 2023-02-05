import 'package:get/get.dart';
import 'package:yalla_mazad/api/page/page_api.dart';
import 'package:yalla_mazad/model/page/page_model.dart';

class AboutUsController extends GetxController {
  static AboutUsController get find => Get.find();

  PageModel? pageModel;
  late Future<PageModel?> initializePageFuture;

  Future<PageModel?> fetchPage() async {
    pageModel = await PageApi().data(
      ///TODO: make sure
      id: 5,
    );
    return pageModel;
  }

  @override
  void onInit() {
    initializePageFuture = fetchPage();
    super.onInit();
  }
}
