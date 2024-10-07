import 'package:auto_size_text/auto_size_text.dart';
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import '../../../../core/asstes/app_images.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../auth/presentation/widgets/custom_flat_buttom.dart';
import '../../controllers/cart_controller.dart';

class CartView extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

   CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: const Center(
          child: Text(
            'Cart',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
      ),
      backgroundColor: AppColors.whiteColor,
      body: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return const Center(child: Text('Your cart is empty.'));
        }
        return ListView.builder(
          itemCount: cartController.cartItems.length,
          itemBuilder: (context, index) {
            var item = cartController.cartItems[index];

            return CartItemWidget(
              productName: item['productName'],
              imageUrl: item['imageUrl'],
              price: item['price'],
              quantity: item['quantity'], // تأكد من تمرير RxInt
              onQuantityChange: (newQuantity) {
                cartController.updateQuantity(index, newQuantity);
              },
              onRemove: () {
                cartController.removeItem(index);
              },
            );
          },
        );
      }),
      bottomNavigationBar: Obx(() {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Divider(
                color: Color.fromARGB(255, 42, 33, 30),
              ),
              Wrap(
                direction: Axis.vertical,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      'Total:',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  AutoSizeText(
                    '\$${cartController.total}',
                    maxFontSize: 20,
                    minFontSize: 15,
                    style: const TextStyle(
                        fontSize: 20,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Row(
                children: [
                  CustomFlatButton(
                    onPressed: () {
                      // تنفيذ عملية الدفع
                    },
                    title: 'Proceed to checkout',
                    width: 160.w,
                    height: 40.h,
                    kTextcolor: AppColors.whiteColor,
                  ),
                  const SizedBox(width: 16),
                  CustomFlatButton(
                    onPressed: () {
                      // تنفيذ عملية الدفع
                    },
                    title: 'coupon',
                    width: 80.w,
                    height: 40.h,
                    kTextcolor: AppColors.whiteColor,
                    kBackgroundcolor: Colors.blue,
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final String productName;
  final String imageUrl;
  final double price;
  final RxInt quantity;
  final ValueChanged<int> onQuantityChange;
  final VoidCallback onRemove;

  const CartItemWidget({
    super.key,
    required this.productName,
    required this.imageUrl,
    required this.price,
    required this.quantity,
    required this.onQuantityChange,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: Colors.grey[100]),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(8),
              //   child: CachedNetworkImage(
              //     imageUrl: imageUrl,
              //     fit: BoxFit.cover,
              //     width: 80.w,
              //     height: 80.h,
              //     placeholder: (context, url) => const SizedBox(),
              //     errorWidget: (context, url, error) => Image.asset(
              //       AppImages.cat1,
              //       fit: BoxFit.cover,
              //       width: 80.w,
              //       height: 80.h,
              //     ),
              //   ),
              // ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 4.h),
                    Text('\$${price.toString()}',
                        style: const TextStyle(color: Colors.grey)),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.do_not_disturb_on,
                              color: AppColors.primaryColor),
                          onPressed: () {
                            onQuantityChange(
                                quantity.value > 1 ? quantity.value - 1 : 1);
                          },
                        ),
                        SizedBox(width: 5.w),
                        Obx(() => Text(
                              '${quantity.value}', // استخدم .value هنا
                              style: TextStyle(fontSize: 24.sp),
                            )),
                        SizedBox(width: 5.w),
                        IconButton(
                          icon: const Icon(Icons.add_circle_outline_outlined,
                              color: AppColors.primaryColor),
                          onPressed: () {
                            onQuantityChange(quantity.value + 1);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon:
                        const Icon(Icons.cancel, color: AppColors.primaryColor),
                    onPressed: onRemove,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => Text(
                      '${price * quantity.value}\$',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
