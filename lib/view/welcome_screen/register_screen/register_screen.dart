import 'package:bookstore_app/core/common/widgets/custom_button.dart';
import 'package:bookstore_app/core/constants/app_colors.dart';
import 'package:bookstore_app/view/welcome_screen/login_screen/login_screen.dart';
import 'package:bookstore_app/view/welcome_screen/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).r,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 50.h,
              ),
              Text(
                'Please fill your details to signup.',
                style: TextStyle(
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              Form(
                child: Column(
                  children: [
                    CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Username',
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Email',
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Password',
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const FaIcon(
                          FontAwesomeIcons.solidEye,
                        ),
                        color: const Color.fromRGBO(37, 37, 37, 1),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Confirm Password',
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const FaIcon(
                          FontAwesomeIcons.solidEye,
                        ),
                        color: const Color.fromRGBO(37, 37, 37, 1),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    CustomButton(
                      onPressed: () {},
                      title: 'Register',
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: AppColors.secondaryColor,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 130.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Alread a Member? ',
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    ),
                    child: Text(
                      'Signin',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
