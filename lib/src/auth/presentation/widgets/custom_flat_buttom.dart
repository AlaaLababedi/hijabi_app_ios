import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class CustomFlatButton extends StatelessWidget {
    const CustomFlatButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.width = double.infinity,
    this.height = double.infinity,
    this.isEnabled = true,
    this.kBackgroundcolor = AppColors.primaryColor,
    this.kTextcolor,
  });

  final void Function() onPressed;
  final String title;
  final Color kBackgroundcolor;
  final Color? kTextcolor;
  final double width;
  final double height;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: kBackgroundcolor,
        fixedSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
       child: AutoSizeText(
        title,
        maxLines: 1,
        maxFontSize: 15,
        minFontSize:10,
        style: TextStyle(
          color: kTextcolor ?? Colors.white, 
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
