import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/home_controller.dart';
import '../../views/product_view.dart';
import 'product_card.dart';

class MainProductListViewWidget extends StatelessWidget {
   MainProductListViewWidget({
    super.key,
  });

    final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 197.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.mainProducts.length,
        itemBuilder: (context, index) {
          final mainProducts = controller.mainProducts[index];
          return ProductCard(
            imageUrl: mainProducts.mainPhoto ?? '',
            currentPrice: mainProducts.price ?? 100,
            oldPrice: 0,
            productName: mainProducts.name ?? '',
            isFavorite: mainProducts.favorite ?? false,
            onTap: () {
              Get.to(ProductView(                          product: mainProducts,

                categoryName: '',
                imageUrl: mainProducts.mainPhoto ?? '',
                name: mainProducts.name ?? '',
                price: mainProducts.price ?? 100,
                favorite: mainProducts.favorite ?? false,
                description: mainProducts.description ?? '',
              ));
            },
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 4.w),
      ),
    );
  }
}
