// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/asstes/app_images.dart';
import '../../../../../core/constants/app_colors.dart';

class CategoryItemFilter extends StatelessWidget {
  final String name;
  final String image;
  final VoidCallback onTap;
  final bool isSelected;

  const CategoryItemFilter({
    super.key,
    required this.name,
    required this.image,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 4),
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.circular(15),
            //     child: CachedNetworkImage(
            //       imageUrl: image,
            //       fit: BoxFit.cover,
            //       width: 45.w,
            //       height: 45.h,
            //       placeholder: (context, url) => const SizedBox(),
            //       errorWidget: (context, url, error) => Image.asset(
            //         AppImages.cat1,
            //         fit: BoxFit.cover,
            //         width: 45.w,
            //         height: 45.h,
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(width: 4.w),
            Expanded(
              child: Text(
                name,
                maxLines: 1, 
                overflow: TextOverflow.ellipsis, 
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}