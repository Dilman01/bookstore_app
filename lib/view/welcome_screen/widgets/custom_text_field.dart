import 'package:bookstore_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.suffixIcon,
    this.obscureText = false,
    this.onFieldSubmitted,
  });

  final TextEditingController controller;
  final String hintText;

  final Widget? suffixIcon;
  final bool obscureText;
  final Function(String)? onFieldSubmitted;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: AppColors.textFieldBgColor,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5).r,
          borderSide: const BorderSide(
            width: 2,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5).r,
          borderSide: BorderSide.none,
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: const Color.fromRGBO(37, 37, 37, 1),
          fontSize: 18.sp,
        ),
        suffixIcon: widget.suffixIcon,
      ),
      obscureText: widget.obscureText,
      obscuringCharacter: '*',
      onFieldSubmitted: widget.onFieldSubmitted,
    );
  }
}
