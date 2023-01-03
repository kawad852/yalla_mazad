import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/api/search_advertisement/search_advertisement_api.dart';
import 'package:yalla_mazad/model/search_advertisement/search_advertisement_model.dart';

import '../../../utils/app_constants.dart';

class SearchController extends GetxController {
  static SearchController get find => Get.find();
  final TextEditingController searchController = TextEditingController();
  final isLoading = false.obs;
  final model = Rxn<SearchAdvertisementModel>();
  final searchQuery = "".obs;
  Timer? _debounce;

  void toggleLoading({required bool status}) {
    isLoading.value = status;
  }

  void onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.isNotEmpty) {
        searchQuery.value = query;
        fetchSearch(query: query);
      } else {
        searchQuery.value = "";
      }
    });
  }

  Future fetchSearch({required String query}) async {
    toggleLoading(status: true);
    model.value = await SearchAdvertisementApi().data(name: query);
    if (model.value != null) {
      if (model.value!.code == 200) {
        toggleLoading(status: false);
      } else {
        toggleLoading(status: false);
        Fluttertoast.showToast(msg: model.value!.msg!);
      }
    } else {
      toggleLoading(status: false);
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
    }
  }
}
