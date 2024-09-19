import 'package:bookstore_app/core/common/widgets/custom_button.dart';
import 'package:bookstore_app/core/constants/app_colors.dart';
import 'package:bookstore_app/view/welcome_screen/register_screen/register_screen.dart';
import 'package:bookstore_app/view/welcome_screen/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Get Started',
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
                'Please fill your details to login.',
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
                      height: 32.h,
                    ),
                    CustomButton(
                      onPressed: () {},
                      title: 'Get Started',
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: AppColors.secondaryColor,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80).r,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    elevation: 0,
                  ),
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 14.sp,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 230.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'New Member? ',
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    ),
                    child: Text(
                      'Register',
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
