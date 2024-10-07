import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_colors.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 338.w,
        height: 50.h,
        child: GestureDetector(
          onTap: () {
            Get.toNamed('/SearchView');
          },
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10).w,
                color: AppColors.whiteColor,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 5, 0).w,
                child: Row(
                  children: [
                    Text(
                      'Search Product Name',
                      style: TextStyle(
                          color: const Color(0xffAFB0B9), fontSize: 16.sp),
                    ),
                    const Spacer(),
                    const Icon(Icons.search, color: AppColors.darkColor),
                  ],
                ),
              )),
        ));
  }
}
