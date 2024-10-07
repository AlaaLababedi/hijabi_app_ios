import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../home/presentation/views/product_view.dart';
import '../../../home/presentation/widgets/products/product_card.dart';
import '../../controller/search_controller.dart';

class GridViewProductsSearch extends StatelessWidget {
  GridViewProductsSearch({
    super.key,
  });

  final SearchControl controller = Get.find<SearchControl>();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.84,
      ),
      padding: const EdgeInsets.all(10),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: controller.productsByName.length,
      itemBuilder: (context, index) {
        final mainProducts = controller.productsByName[index];
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: ProductCard(
            imageUrl: mainProducts.mainPhoto ?? '',
            currentPrice: mainProducts.price ?? 100,
            productName: mainProducts.name ?? '',
            isFavorite: mainProducts.favorite ?? true,
            onTap: () {
              Get.to(ProductView(
                product: mainProducts,
                categoryName: '',
                imageUrl: mainProducts.mainPhoto ?? '',
                name: mainProducts.name ?? '',
                price: mainProducts.price ?? 100,
                favorite: mainProducts.favorite ?? false,
                description: mainProducts.description ?? '',
              ));
            },
          ),
        );
      },
    );
  }
}
