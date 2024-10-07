import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../../controller/search_controller.dart';
import '../widgets/grid_item_shimmer.dart';
import '../widgets/grid_view_products_search.dart';
import '../widgets/no_products_found_view.dart';
import '../widgets/recent_widget.dart';
import '../widgets/search_page_text_field.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
          final SearchControl controller = Get.find<SearchControl>();

    // SearchControl controller = Get.find<SearchControl>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
        title: const Text('Search'),
      ),
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          children: [
            SearchPageTextField(),
            SizedBox(height: 10.h),
            Obx(() {
              return controller.isOpen.value
                  ? RecentWidget()
                  : const SizedBox();
            }),
            Obx(() {
              if (controller.isLoadingProductsByName.value) {
                return GridItemShimmer();
              }
              return controller.productsByName.isEmpty
                  ? const NoProductsFoundView()
                  : GridViewProductsSearch();
            }),
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
    );
  }
}
