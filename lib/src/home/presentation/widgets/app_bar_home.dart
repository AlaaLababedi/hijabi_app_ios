import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/asstes/app_images.dart';
import '../../../../core/constants/app_colors.dart';
import '../views/cart_view.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const AppBarHome({super.key})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      backgroundColor: AppColors.whiteColor,
      title: Center(
          child: Image.asset(
        AppImages.logo,
        width: 50,
        height: 50,
      )),
      leading: IconButton(
        icon: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_none_outlined,
              color: Colors.black),
          onPressed: () {
            Get.to(CartView());
          },
        ),
      ],
    );
  }
}
