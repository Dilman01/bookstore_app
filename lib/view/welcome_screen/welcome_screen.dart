import 'package:bookstore_app/core/common/widgets/custom_button.dart';
import 'package:bookstore_app/core/constants/app_colors.dart';
import 'package:bookstore_app/core/constants/asset_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 480.h,
                width: double.infinity,
                padding: const EdgeInsets.only(bottom: 40).r,
                child: Image.asset(
                  AssetPaths.backgroundImage,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: SvgPicture.asset(
                  AssetPaths.logo,
                  height: 137.h,
                  width: 137.w,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25).r,
            child: Text(
              'Read more and stress less with our online book shopping app. Shop from anywhere you are and discover titles that you love. Happy reading!',
              style: TextStyle(
                fontSize: 14.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          CustomButton(
            onPressed: () {},
            title: 'Get Started',
            backgroundColor: AppColors.primaryColor,
            foregroundColor: AppColors.secondaryColor,
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomButton(
            onPressed: () {},
            title: 'Register',
            backgroundColor: AppColors.secondaryColor,
            foregroundColor: AppColors.primaryColor,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
