import 'package:bookstore_app/view/auth/forgot_password_screen/forgot_password_screen.dart';
import 'package:bookstore_app/view_model/auth_view_model/auth_view_model.dart';
import 'package:flutter/material.dart';

import 'package:bookstore_app/core/common/widgets/custom_button.dart';
import 'package:bookstore_app/core/constants/app_colors.dart';
import 'package:bookstore_app/view/auth/register_screen/register_screen.dart';
import 'package:bookstore_app/view/auth/widgets/custom_text_field.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends StatefulHookConsumerWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final showPassword = useState(false);

    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
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
                  height: 30.h,
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
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: emailController,
                        hintText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (!value!.contains('@') || value.isEmpty) {
                            return 'Invalid email.';
                          }

                          return null;
                        },
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      CustomTextField(
                        controller: passwordController,
                        hintText: 'Password',
                        suffixIcon: IconButton(
                          onPressed: () {
                            showPassword.value = !showPassword.value;
                          },
                          icon: FaIcon(
                            showPassword.value
                                ? FontAwesomeIcons.solidEyeSlash
                                : FontAwesomeIcons.solidEye,
                          ),
                          color: const Color.fromRGBO(37, 37, 37, 1),
                        ),
                        obscureText: !showPassword.value,
                        enableSuggestions: false,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value!.length < 6 || value.isEmpty) {
                            return 'Password must be at least 6 characters.';
                          }

                          return null;
                        },
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      CustomButton(
                        onPressed: () {
                          if (_formKey.currentState != null &&
                              _formKey.currentState!.validate()) {
                            ref
                                .read(authViewModelProvider.notifier)
                                .signIn(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                )
                                .then(
                              (value) {
                                print('==================================');
                                print(value);
                                print('==================================');
                                if (value) {
                                  // ignore: use_build_context_synchronously
                                  Navigator.of(context).pop();
                                }
                              },
                            );
                          }
                        },
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
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ForgotPasswordScreen(),
                        ),
                      );
                    },
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
      ),
    );
  }
}
