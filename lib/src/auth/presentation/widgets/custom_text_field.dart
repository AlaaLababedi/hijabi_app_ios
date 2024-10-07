import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.obscureText = false,
    required this.hintText,
    required this.onChanged,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.width,
    this.height,
  });

  final bool obscureText;
  final String hintText;
  final void Function(String) onChanged;
  final TextInputType keyboardType;
  final IconData? prefixIcon;
  final double? width;
  final double? height;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode _focusNode;
  bool _isFocused = false;
  bool _enableObscureText = false;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
    _controller = TextEditingController();
    _enableObscureText = widget.obscureText;
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0).w,
      child: SizedBox(
        width: 327.w,
        height: 52.h,
        child: TextFormField(
          focusNode: _focusNode,
          obscureText: _enableObscureText,
          cursorColor: Theme.of(context).colorScheme.inverseSurface,
          cursorOpacityAnimates: true,
          onChanged: widget.onChanged,
          keyboardType: widget.keyboardType,
          controller: _controller,
          style: _enableObscureText && _controller.text != ''
              ? TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins-Medium',
                  fontSize: 14.sp,
                )
              : TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins-Medium',
                ),
          decoration: InputDecoration(
            fillColor: AppColors.whiteColor,
            prefixIcon: widget.prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.all(14),
                    child: Icon(
                      widget.prefixIcon,
                      size: 22.5.w,
                    ),
                  )
                : null,
            prefixIconColor:
                _isFocused ? AppColors.primaryColor : AppColors.darkColor,
            suffixIcon: widget.obscureText
                ? Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                    child: IconButton(
                      iconSize: 20.w,
                      icon: _enableObscureText
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _enableObscureText = !_enableObscureText;
                        });
                      },
                    ),
                  )
                : null,
            suffixIconColor:
                _isFocused ? AppColors.darkColor : AppColors.greyColor,
            hintText: widget.hintText,
            hintStyle: TextStyle(
                color: AppColors.greyColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10).w,
              borderSide: const BorderSide(
                color: AppColors.darkColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10).w,
              borderSide: const BorderSide(color: AppColors.primaryColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10).w,
              borderSide: const BorderSide(color: Colors.red),
            ),
            constraints: const BoxConstraints(
              maxWidth: double.infinity,
            ),
          ),
        ),
      ),
    );
  }
}
