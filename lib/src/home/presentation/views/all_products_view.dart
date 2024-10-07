import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../../controllers/home_controller.dart';
// ignore: unused_import
import '../../data/repositories/home_repo.dart';
import '../widgets/products/product_card.dart';
import 'product_view.dart';

class AllProductsView extends StatelessWidget {
  const AllProductsView({
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
            'Products',
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
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.84,
                ),
                padding: const EdgeInsets.all(10),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.mainProducts.length,
                itemBuilder: (context, index) {
                  final mainProducts = controller.mainProducts[index];
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
            }),
          ],
        ),
      ),
    );
  }
}
