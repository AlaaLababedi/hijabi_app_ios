import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_colors.dart';
import '../../controllers/home_controller.dart';
import '../widgets/app_bar_home.dart';
import '../widgets/categories/categories_item_shimmer.dart';
import '../widgets/categories/categories_list_view_widget.dart';
import '../widgets/categories/categories_widgets.dart';
import '../widgets/products/main_product_list_view_widget.dart';
import '../widgets/products/most_order_widget.dart';
import '../widgets/products/noProducts.dart';
import '../widgets/products/product_by_category_list_view_widget.dart';
import '../widgets/products/product_item_shimmer.dart';
import '../widgets/search_widget.dart';
import '../widgets/slider/slider_item_shimmer.dart';
import '../widgets/slider/slider_list_view_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    // تحديث البيانات عند تحميل الصفحة
    controller.refreshAllData();

    return Scaffold(
      appBar: const AppBarHome(),
      backgroundColor: AppColors.whiteColor,
      body: RefreshIndicator(
        onRefresh: controller
            .refreshAllData, // استدعاء تحديث كل البيانات عند السحب للأسفل
        child: SingleChildScrollView(
          physics:
              const AlwaysScrollableScrollPhysics(), // يسمح بالسحب للتحديث حتى لو كانت القائمة قصيرة
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0).w,
            child: Column(
              children: [
                const SearchTextField(),
                SizedBox(height: 10.h),
                Obx(() {
                  if (controller.isLoadingSlidars.value) {
                    return const SliderItemShimmer();
                  } else if (controller.slidars.isEmpty) {
                    return Container(
                      height: 100.h,
                      color: Colors.black,
                    );
                  } else {
                    return SliderListViewWidget();
                  }
                }),
                SizedBox(height: 20.h),
                const CategoriesWidgets(),
                SizedBox(height: 10.h),
                Obx(() {
                  if (controller.isLoadingCategories.value) {
                    return const CategoriesItemShimmer();
                  } else if (controller.categories.isEmpty) {
                    return Container(
                      height: 45.h,
                      color: Colors.black,
                    );
                  } else {
                    return const CategoriesListViewWidget();
                  }
                }),
            
                SizedBox(height: 20.h),
                Obx(() {
                  if (controller.isLoadingMainProducts.value) {
                    return const ProductsItemShimmer();
                  } else if (controller.selectedCategoryId.value == 0) {
                    if (controller.isLoadingMainProducts.value) {
                      return const ProductsItemShimmer();
                    } else if (controller.mainProducts.isEmpty) {
                      return Container(
                        height: 197.h,
                        color: Colors.white,
                        child: const NoProductsWidget(),
                      );
                    } else {
                      return MainProductListViewWidget();
                    }
                  } else {
                    if (controller.isLoadingProductsByCategory.value) {
                      return const ProductsItemShimmer();
                    }
                    if (controller.productByCategory.isEmpty) {
                      return Container(
                        height: 197.h,
                        color: Colors.white,
                        child: const NoProductsWidget(),
                      );
                    } else {
                      return ProductByCategoryListViewWidget();
                    }
                  }
                }),
                SizedBox(height: 20.h),
                const MainProductsWidget(),
                SizedBox(height: 20.h),
                Obx(() {
                  if (controller.isLoadingMainProducts.value) {
                    return const ProductsItemShimmer();
                  } else if (controller.mainProducts.isEmpty) {
                    return const NoProductsWidget();
                  } else {
                    return MainProductListViewWidget();
                  }
                }),
                SizedBox(height: 20.h),
                Obx(() {
                  if (controller.errorMessage.isNotEmpty) {
                    Future.delayed(Duration.zero, () {
                      Get.snackbar(
                        'Error',
                        controller.errorMessage.value,
                        backgroundColor: AppColors.greyColor,
                      );
                    });
                  }
                  return Container();
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
