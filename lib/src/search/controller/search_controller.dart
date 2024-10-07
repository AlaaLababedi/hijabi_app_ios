import 'package:flutter/widgets.dart';
import 'package:get/get.dart';


import '../../home/data/models/product_model.dart';
import '../data/repositories/search_repo.dart';

class SearchControl extends GetxController {
  var productsByName = <ProductModel>[].obs;
  var searchText = ''.obs;
  TextEditingController searchName = TextEditingController();
  var isLoadingProductsByName = false.obs;
  var errorMessage = ''.obs;
  var isOpen = true.obs;

  final SearchRepository searchRepository = Get.find<SearchRepository>();

  Future<void> fetchProductsByName() async {
    if (searchText.value.isEmpty) return;

    isLoadingProductsByName.value = true;
    try {
      final fetchedProductsByName = await searchRepository.searchByName();
      productsByName.value = fetchedProductsByName;
    } catch (e) {
      errorMessage.value = (e.toString());
    } finally {
      isLoadingProductsByName.value = false;
    }
  }

  void updateSearchText(String newText) {
    searchText.value = newText;
    isOpen.value = newText.isEmpty;
    fetchProductsByName();
  }
}
