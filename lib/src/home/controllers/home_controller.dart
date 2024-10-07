import 'package:get/get.dart';
import '../data/models/category_model.dart';
import '../data/models/product_model.dart';
import '../data/models/slidar_model.dart';
import '../data/repositories/home_repo.dart';

class HomeController extends GetxController {
  var categories = <CategoryModel>[].obs;
  var mainProducts = <ProductModel>[].obs;
  var productByCategory = <ProductModel>[].obs;
  var slidars = <SlidarModel>[].obs;
  var isLoadingCategories = false.obs;
  var isLoadingMainProducts = false.obs;
  var isLoadingProductsByCategory = false.obs;
  var isLoadingSlidars = false.obs;
  var isLoadingAll = false.obs; 
  var selectedCategoryId = 0.obs;
  var isExpanded = false.obs;
  var errorMessage = ''.obs;

  final HomeRepository homeRepository = Get.find<HomeRepository>();

  Future<void> refreshAllData() async {
    isLoadingAll.value = true;
    try {
      await Future.wait([
        fetchCategories(),
        fetchMainProducts(),
        fetchSlidars(),
        fetchProductsByCategory(),
      ]);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoadingAll.value = false;
    }
  }

  Future<void> fetchData(Function fetchFunction, RxList data, RxBool loading) async {
    loading.value = true;
    try {
      data.value = await fetchFunction();
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      loading.value = false;
    }
  }

  Future<void> fetchCategories() async {
    await fetchData(() => homeRepository.getCategories(), categories, isLoadingCategories);
  }

  Future<void> fetchMainProducts() async {
    await fetchData(() => homeRepository.getMainProducts(), mainProducts, isLoadingMainProducts);
  }

  Future<void> fetchProductsByCategory() async {
    await fetchData(
      () => homeRepository.getProductsByCategory(selectedCategoryId.value), 
      productByCategory, 
      isLoadingProductsByCategory
    );
  }

  Future<void> fetchSlidars() async {
    await fetchData(() => homeRepository.getSlidars(), slidars, isLoadingSlidars);
  }

  void updateCategoryId(int? categorySelected) {
    if (categorySelected != null && selectedCategoryId.value != categorySelected) {
      selectedCategoryId.value = categorySelected;
      fetchProductsByCategory();
    }
  }

  void toggleExpand() {
    isExpanded.value = !isExpanded.value;
  }
}
