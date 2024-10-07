import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../search/presentation/widgets/grid_item_shimmer.dart';
import '../../controllers/home_controller.dart';
import '../widgets/categories/category_item_filter.dart';
import 'category_view.dart';
class AllCategoriesView extends StatelessWidget {
  const AllCategoriesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: Center(
          child: Text(
            'Categories',
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() {
              // ignore: unused_local_variable
              final int alaa = controller.selectedCategoryId.value;
              return controller.categories.isEmpty
                  ? GridItemShimmer()
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2.9,
                      ),
                      padding: const EdgeInsets.all(10),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.categories.length,
                      itemBuilder: (context, index) {
                        final category = controller.categories[index];
                        bool isSelected =
                            controller.selectedCategoryId.value == category.id;
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CategoryItemFilter(
                            image: category.photo,
                            name: category.name,
                            onTap: () {
                              controller.updateCategoryId(category.id);
                              Get.to(
                                CategoryView(
                                name: controller.categories[index].name,
                              ));
                            },
                            isSelected: isSelected,
                          ),
                        );
                      },
                    );
            }),
          ],
        ),
      ),
    );
  }
}
