// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/asstes/app_images.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../auth/presentation/widgets/custom_flat_buttom.dart';
import '../../../controllers/cart_controller.dart';
import '../../../controllers/home_controller.dart';
import '../../../data/models/product_model.dart';
import '../../views/product_view.dart';
import 'product_card.dart';
import 'product_item_shimmer.dart';
import 'text_descriptions.dart';

class ProductBody extends StatelessWidget {
  const ProductBody({
    super.key,
    required this.imageUrl,
    required this.favorite,
    required this.name,
    required this.price,
    required this.categoryName,
    required this.description,
    required this.product,
  });

  final String imageUrl;
  final bool favorite;
  final String name;
  final int price;
  final String categoryName;
  final String description;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Stack(
          children: [
            
            Positioned(
              top: 25.h,
              left: 16.w,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                decoration: BoxDecoration(
                  color: const Color(0x65656580),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            Positioned(
              top: 25.h,
              right: 16.w,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                decoration: BoxDecoration(
                  color: const Color(0x65656580),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  icon: Icon(
                    favorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    name,
                    style:
                        TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w400),
                  ),
                  const Spacer(),
                  Text(
                    '$price\$',
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    categoryName,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.do_not_disturb_on,
                            color: AppColors.primaryColor),
                        onPressed: () {
                          // Get.find<HomeController>().decrement();
                        },
                      ),
                      SizedBox(width: 5.w),
                      // Obx(() => Text(
                      //       '${Get.find<HomeController>().count}',
                      //       style: TextStyle(fontSize: 24.sp),
                      //     )),
                      SizedBox(width: 5.w),
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline_outlined,
                            color: AppColors.primaryColor),
                        onPressed: () {
                          // Get.find<HomeController>().increment();
                        },
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Description',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor),
                ),
              ),
              SizedBox(height: 8.h),
              TextViewExample(
                text: description,
              ),
              SizedBox(height: 20.h),
              Text(
                'Similar products',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8.h),
              Obx(() {
                if (Get.find<HomeController>().mainProducts.isEmpty) {
                  return const ProductsItemShimmer();
                } else {
                  return SizedBox(
                    height: 197.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: Get.find<HomeController>().mainProducts.length,
                      itemBuilder: (context, index) {
                        final mainProducts =
                            Get.find<HomeController>().mainProducts[index];
                        return ProductCard(
                          imageUrl: mainProducts.mainPhoto ?? '',
                          currentPrice: mainProducts.price ?? 100,
                          oldPrice: 0,
                          productName: mainProducts.name ?? '',
                          isFavorite: mainProducts.favorite ?? false,
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
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 4.w),
                    ),
                  );
                }
              }),
              const SizedBox(height: 16),
              CustomFlatButton(
                isEnabled: false,
                height: 50.h,
                width: 375.w,
                onPressed: () {
                  Get.find<CartController>().addToCart(
                      product, Get.find<CartController>().count.value);
                  Get.snackbar('Added to Cart',
                      '${product.name} x${Get.find<CartController>().count.value}');
                },
                title: 'Add to Cart',
                kTextcolor: AppColors.whiteColor,
              )
            ],
          ),
        ),
      ]),
    );
  }
}
