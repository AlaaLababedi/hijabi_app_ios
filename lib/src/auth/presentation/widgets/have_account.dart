import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';

class HaveAnAccountTextButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final void Function() onTap;

  const HaveAnAccountTextButton({
    required this.onTap,
    required this.title,
    required this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(color: AppColors.greyColor, fontSize: 14.sp),
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            subtitle,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: AppColors.primaryColor,
                fontSize: 14.sp),
          ),
        ),
      ],
    );
  }
}
