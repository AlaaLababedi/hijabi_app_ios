 import 'package:_ios/src/auth/controller/auth_controller.dart';
import 'package:_ios/src/auth/data/repositories/auth_repo.dart';
import 'package:_ios/src/auth/presentation/views/login_view.dart';
import 'package:_ios/src/home/controllers/home_controller.dart';
import 'package:_ios/src/home/data/repositories/home_repo.dart';
import 'package:_ios/src/search/controller/search_controller.dart';
import 'package:_ios/src/search/data/repositories/search_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'src/auth/presentation/views/register_view.dart';
import 'src/home/presentation/views/home_view.dart';
import 'src/search/presentation/view/search_view.dart';

void main() {
  Get.put<HomeRepository>(HomeRepository());
  Get.put<AuthRepository>(AuthRepository());
  Get.put<SearchRepository>(SearchRepository());

  Get.put<HomeController>(HomeController());
  Get.put<AuthController>(AuthController());
  Get.put<SearchControl>(SearchControl());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return GetMaterialApp(
          theme: ThemeData(fontFamily: 'Poppins'),
          debugShowCheckedModeBanner: false,
          initialRoute: '/HomeView',
          getPages: [
            GetPage(
              name: '/HomeView',
              page: () => const HomeView(),
            ),
            GetPage(
              name: '/LoginView',
              page: () => const LoginView(),
            ),
            GetPage(
              name: '/RegisterView',
              page: () => const RegisterView(),
            ),
            GetPage(
              name: '/SearchView',
              page: () => const SearchView(),
            ),
          ],
        );
      },
      child: const HomeView(),
    );
  }
}
