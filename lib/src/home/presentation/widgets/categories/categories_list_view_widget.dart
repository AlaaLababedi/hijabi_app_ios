import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/home_controller.dart';
import 'category_item.dart';

class CategoriesListViewWidget extends StatefulWidget {
  const CategoriesListViewWidget({
    super.key,
  });

  @override
  State<CategoriesListViewWidget> createState() =>
      _CategoriesListViewWidgetState();
}

class _CategoriesListViewWidgetState extends State<CategoriesListViewWidget> {
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SizedBox(
        height: 45.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            final category = controller.categories[index];
            bool isSelected =
                controller.selectedCategoryId.value == category.id;

            return CategoryItem(
              name: category.name,
              image: category.photo,
              isSelected: isSelected,
              onTap: () {
                setState(() {
                  controller.updateCategoryId(category.id);
                  isSelected = !isSelected;
                });
              },
            );
          },
          separatorBuilder: (context, index) => SizedBox(width: 10.w),
        ),
      );
    });
  }
}
