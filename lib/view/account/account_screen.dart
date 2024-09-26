import 'package:flutter/material.dart';

import 'package:bookstore_app/core/constants/app_colors.dart';
import 'package:bookstore_app/view_model/auth_view_model/auth_view_model.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 32.h,
            ),
            Center(
              child: Container(
                height: 100.h,
                width: 100.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor,
                ),
                child: Center(
                  child: Icon(
                    Icons.person,
                    color: AppColors.secondaryColor,
                    size: 100.r,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 26.h,
            ),
            Container(
              height: 56.h,
              width: 320.w,
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ).r,
              decoration: BoxDecoration(
                color: AppColors.textFieldBgColor,
                borderRadius: BorderRadius.circular(5).r,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Name:',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Spacer(),
                  Text(
                    'Dilman Arif',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 26.h,
            ),
            Container(
              height: 56.h,
              width: 320.w,
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ).r,
              decoration: BoxDecoration(
                color: AppColors.textFieldBgColor,
                borderRadius: BorderRadius.circular(5).r,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'E-mail:',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Spacer(),
                  Text(
                    'dilmanarif01@gmail.com',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 26.h,
            ),
            Container(
              height: 56.h,
              width: 320.w,
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ).r,
              decoration: BoxDecoration(
                color: AppColors.textFieldBgColor,
                borderRadius: BorderRadius.circular(5).r,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Password:',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Spacer(),
                  Text(
                    '******',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 26.h,
            ),
            Container(
              height: 85.h,
              width: 320.w,
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ).r,
              decoration: BoxDecoration(
                color: AppColors.textFieldBgColor,
                borderRadius: BorderRadius.circular(5).r,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Address:',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Spacer(),
                  Text(
                    'Erbil-Kurdistan',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(154.w, 48.h),
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: AppColors.secondaryColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5).r,
                    ),
                  ),
                  child: Text(
                    'Edit',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: AppColors.secondaryColor,
                        ),
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Consumer(
                  builder: (_, ref, __) {
                    return ElevatedButton(
                      onPressed: () {
                        ref.read(authViewModelProvider.notifier).signOut();
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(154.w, 48.h),
                        backgroundColor: AppColors.secondaryColor,
                        foregroundColor: AppColors.primaryColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5).r,
                          side: BorderSide(
                            color: AppColors.primaryColor,
                            width: 2.w,
                          ),
                        ),
                      ),
                      child: Text(
                        'Log out',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: AppColors.primaryColor,
                            ),
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
