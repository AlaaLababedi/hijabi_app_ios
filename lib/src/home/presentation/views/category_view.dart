import 'package:_ios/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../search/presentation/widgets/grid_item_shimmer.dart';
import '../../controllers/home_controller.dart';
import '../widgets/products/noProducts.dart';
import '../widgets/products/product_card.dart';
import 'product_view.dart';

class CategoryView extends StatelessWidget {
   CategoryView({
    super.key,
    required this.name,
  });
  final HomeController controller = Get.find<HomeController>();

  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          alignment: Alignment.center,
          child: Text(
            name,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() {
              if (controller.isLoadingMainProducts.value) {
                return GridItemShimmer();
              } else if (controller.selectedCategoryId.value == 0) {
                if (controller.isLoadingMainProducts.value) {
                  return GridItemShimmer();
                } else if (controller.mainProducts.isEmpty) {
                  return Container(
                    height: 197.h,
                    color: Colors.white,
                    child: const NoProductsWidget(),
                  );
                } else {
                  return SizedBox(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.84,
                      ),
                      padding: const EdgeInsets.all(10),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.productByCategory.length,
                      itemBuilder: (context, index) {
                        final mainProducts =
                            controller.productByCategory[index];
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
                    ),
                  );
                }
              } else {
                if (controller.isLoadingProductsByCategory.value) {
                  return GridItemShimmer();
                }
                if (controller.productByCategory.isEmpty) {
                  return Container(
                    height: 197.h,
                    color: Colors.white,
                    child: const NoProductsWidget(),
                  );
                } else {
                  return SizedBox(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.84,
                      ),
                      padding: const EdgeInsets.all(10),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.productByCategory.length,
                      itemBuilder: (context, index) {
                        final mainProducts =
                            controller.productByCategory[index];
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
                    ),
                  );
                }
              }
            }),
            // Obx(() {
            //   return controller.selectedCategoryId.value == 0
            //       ? (controller.mainProducts.isEmpty
            //           ? const CircularProgressIndicator()
            //           : SizedBox(
            //               child: GridView.builder(
            //                 gridDelegate:
            //                     const SliverGridDelegateWithFixedCrossAxisCount(
            //                   crossAxisCount: 2,
            //                   childAspectRatio: 0.84,
            //                 ),
            //                 padding: const EdgeInsets.all(10),
            //                 physics: const NeverScrollableScrollPhysics(),
            //                 shrinkWrap: true,
            //                 itemCount: controller.productByCategory.length,
            //                 itemBuilder: (context, index) {
            //                   final mainProducts =
            //                       controller.productByCategory[index];
            //                   return Padding(
            //                     padding: const EdgeInsets.all(10.0),
            //                     child: ProductCard(
            //                       imageUrl: mainProducts.mainPhoto ?? '',
            //                       currentPrice: mainProducts.price ?? 100,
            //                       productName: mainProducts.name ?? '',
            //                       isFavorite: mainProducts.favorite ?? true,
            //                       onTap: () {
            //                         Get.to(ProductView(                          product: mainProducts,

            //                           categoryName: '',
            //                           imageUrl: mainProducts.mainPhoto ?? '',
            //                           name: mainProducts.name ?? '',
            //                           price: mainProducts.price ?? 100,
            //                           favorite:
            //                               mainProducts.favorite ?? false,
            //                           description:
            //                               mainProducts.description ?? '',
            //                         ));
            //                       },
            //                     ),
            //                   );
            //                 },
            //               ),
            //             ))
            //       : (controller.productByCategory.isEmpty
            //           ? const CircularProgressIndicator()
            //           : SizedBox(
            //               child: GridView.builder(
            //                 gridDelegate:
            //                     const SliverGridDelegateWithFixedCrossAxisCount(
            //                   crossAxisCount: 2,
            //                   childAspectRatio: 0.84,
            //                 ),
            //                 padding: const EdgeInsets.all(10),
            //                 physics: const NeverScrollableScrollPhysics(),
            //                 shrinkWrap: true,
            //                 itemCount: controller.productByCategory.length,
            //                 itemBuilder: (context, index) {
            //                   final mainProducts =
            //                       controller.productByCategory[index];
            //                   return Padding(
            //                     padding: const EdgeInsets.all(10.0),
            //                     child: ProductCard(
            //                       imageUrl: mainProducts.mainPhoto ?? '',
            //                       currentPrice: mainProducts.price ?? 100,
            //                       productName: mainProducts.name ?? '',
            //                       isFavorite: mainProducts.favorite ?? true,
            //                       onTap: () {
            //                         Get.to(ProductView(                          product: mainProducts,

            //                           categoryName: '',
            //                           imageUrl: mainProducts.mainPhoto ?? '',
            //                           name: mainProducts.name ?? '',
            //                           price: mainProducts.price ?? 100,
            //                           favorite:
            //                               mainProducts.favorite ?? false,
            //                           description:
            //                               mainProducts.description ?? '',
            //                         ));
            //                       },
            //                     ),
            //                   );
            //                 },
            //               ),
            //             ));
            // }),
          ],
        ),
      ),
    );
  }
}
