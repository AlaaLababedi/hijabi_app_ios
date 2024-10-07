import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/asstes/app_images.dart';
import '../../../controllers/home_controller.dart';
class SliderListViewWidget extends StatelessWidget {
   SliderListViewWidget({
    super.key,
  });
// 
    final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.slidars.length,
        itemBuilder: (context, index) => buildCard(
            controller.slidars[index].image ?? '',
            controller.slidars[index].title ?? ''),
        separatorBuilder: (context, index) => SizedBox(width: 4.w),
      ),
    );
  }
}

Widget buildCard(String imagePath, String text) {
  List<String> words = text.split(' ');

  return SliderWidget(words: words);
}

class SliderWidget extends StatelessWidget {
  const SliderWidget({
    super.key,
    required this.words,
  });

  final List<String> words;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315,
      height: 150,
      margin: const EdgeInsets.only(right: 10),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              AppImages.coverAdv2,
              fit: BoxFit.cover,
              width: 170,
              height: 150,
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              width: 160,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
              ),
            ),
          ),
          Positioned(
            left: 120,
            bottom: 0,
            child: ClipOval(
              child: Container(
                width: 75,
                height: 150,
                color: Colors.blue,
              ),
            ),
          ),
          Positioned(
            left: 30,
            top: 30,
            child: Column(
              children: [
                for (int i = 0; i < (words.length > 3 ? 3 : words.length); i++)
                  Text(
                    words[i],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
