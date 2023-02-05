import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:yalla_mazad/api/search_advertisement/search_advertisement_api.dart';
import 'package:yalla_mazad/model/search_advertisement/search_advertisement_model.dart';

class SearchController extends GetxController {
  static SearchController get find => Get.find();
  final TextEditingController searchController = TextEditingController();
  final searchQuery = "".obs;
  Timer? _debounce;
  late PagingController<int, SearchedAdList> searchPagingController;

  Future<void> fetchSearchPage(int pageKey, String query) async {
    try {
      final model =
          await SearchAdvertisementApi().data(name: query, pageKey: pageKey);
      final newItems = model!.data;
      if (newItems!.isEmpty) {
        searchPagingController.appendLastPage(newItems);
      } else {
        searchPagingController.appendPage(newItems, pageKey + 1);
      }
    } catch (e) {
      searchPagingController.error = e;
    }
  }

  void onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.isNotEmpty) {
        searchQuery.value = query;
        searchPagingController.refresh();
      } else {
        searchQuery.value = "";
      }
    });
  }

  @override
  void onInit() {
    searchPagingController = PagingController(firstPageKey: 1)
      ..addPageRequestListener((pageKey) {
        fetchSearchPage(
          pageKey,
          searchQuery.value,
        );
      });
    super.onInit();
  }

  @override
  void onClose() {
    searchPagingController.dispose();
    super.onClose();
  }
}
