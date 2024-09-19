import 'package:bookstore_app/core/constants/app_colors.dart';
import 'package:bookstore_app/view/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData().copyWith(
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: AppColors.secondaryColor,
          ),
          scaffoldBackgroundColor: AppColors.secondaryColor,
        ),
        home: const WelcomeScreen(),
      ),
    );
  }
}
