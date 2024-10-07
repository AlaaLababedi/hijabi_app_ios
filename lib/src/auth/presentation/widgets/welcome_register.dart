import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/asstes/app_images.dart';
import '../../../../core/constants/app_colors.dart';

// ignore: must_be_immutable
class WelcomeRegister extends StatefulWidget {
  String? title;
  String? descrption;

  WelcomeRegister({super.key, required this.title, required this.descrption});

  @override
  State<WelcomeRegister> createState() => _WelcomeRegisterState();
}

class _WelcomeRegisterState extends State<WelcomeRegister> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(AppImages.logo,
              height: 95.h, width: 49.w, fit: BoxFit.fill),
        ),
        Text(
          '${widget.title}',
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins-SemiBold',
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          'Let’s ${widget.descrption}',
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.greyColor),
        ),
      ],
    );
  }
}
