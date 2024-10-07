// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/asstes/app_images.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final int currentPrice;
  final int? oldPrice;
  final bool isFavorite;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.currentPrice,
    this.oldPrice,
    required this.isFavorite, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
           onTap: onTap,

      child: Container(
        width: 151.w,
        height: 191.h,
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(10.w)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                //   child: CachedNetworkImage(
                //     imageUrl: imageUrl,
                //     fit: BoxFit.fitWidth,
                //     height: 122.h,
                //     width: 136.w,
                //     placeholder: (context, url) => const SizedBox(),
                //     errorWidget: (context, url, error) => Image.asset(
                //       fit: BoxFit.fitWidth,
                //       AppImages.pro1,
                //       height: 122.h,
                //       width: 136.w,
                //     ),
                //   ),
                // ),
                Positioned(
                  top: 15,
                  right: 15,
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      padding: const EdgeInsets.all(1),
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: Colors.red,
                        size: 24,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '$currentPrice',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        '$oldPrice',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w300,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
