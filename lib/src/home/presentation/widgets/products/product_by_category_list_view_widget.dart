import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/home_controller.dart';
import '../../views/product_view.dart';
import 'product_card.dart';

class ProductByCategoryListViewWidget extends StatelessWidget {
  ProductByCategoryListViewWidget({
    super.key,
  });

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 197.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.productByCategory.length,
        itemBuilder: (context, index) {
          final productByCategory = controller.productByCategory[index];
          return ProductCard(
            imageUrl: productByCategory.mainPhoto ?? '',
            currentPrice: productByCategory.price ?? 100,
            oldPrice: 0,
            productName: productByCategory.name ?? '',
            isFavorite: productByCategory.favorite ?? true,
            onTap: () {
              Get.to(ProductView(
                product: productByCategory,
                categoryName: '',
                imageUrl: productByCategory.mainPhoto ?? '',
                name: productByCategory.name ?? '',
                price: productByCategory.price ?? 100,
                favorite: productByCategory.favorite ?? false,
                description: productByCategory.description ?? '',
              ));
            },
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 4.w),
      ),
    );
  }
}
