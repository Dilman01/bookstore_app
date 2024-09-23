import 'package:bookstore_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CAppBarTheme {
  CAppBarTheme._();

  static AppBarTheme lightAppBarTheme = const AppBarTheme().copyWith(
    backgroundColor: AppColors.secondaryColor,
    scrolledUnderElevation: 0,
    elevation: 0,
  );
}
