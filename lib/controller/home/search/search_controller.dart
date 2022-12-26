import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  static SearchController get find => Get.find();
  final TextEditingController searchController = TextEditingController();
}
