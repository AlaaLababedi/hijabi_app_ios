
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../../controller/search_controller.dart';

class SearchPageTextField extends StatelessWidget {
   SearchPageTextField({
    super.key,
  });

          final SearchControl controller = Get.find<SearchControl>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 338.w,
      height: 50.h,
      child: TextField(
        controller: controller.searchName,
        onChanged: (value) {
          controller.updateSearchText(value);
        },
        decoration: InputDecoration(
          hintText: 'Search Product Name',
          suffixIcon: const Icon(Icons.search),
          focusColor: AppColors.whiteColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10).w,
            borderSide: const BorderSide(
              color: AppColors.whiteColor,
            ),
          ),
          focusedBorder: InputBorder.none,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10).w,
          ),
          filled: true,
          fillColor: AppColors.whiteColor,
        ),
      ),
    );
  }
}
