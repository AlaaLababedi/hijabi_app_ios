import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../controllers/home_controller.dart';

class TextViewExample extends StatelessWidget {
  final String text;
  final HomeController controller = Get.find();

  TextViewExample({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            maxLines: controller.isExpanded.value ? null : 2,
            overflow: controller.isExpanded.value
                ? TextOverflow.visible
                : TextOverflow.ellipsis,
            style: TextStyle(
              color: const Color(0xAAAAAAAA),
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          if (text.split('\n').length > 2)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: controller.toggleExpand,
                  child: Text(controller.isExpanded.value ? 'Show less' : 'Show more',style: const TextStyle(color: AppColors.darkColor),),
                ),
              ],
            ),
        ],
      );
    });
  }
}