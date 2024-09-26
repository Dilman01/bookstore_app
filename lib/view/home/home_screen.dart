import 'package:bookstore_app/core/constants/app_colors.dart';
import 'package:bookstore_app/view/home/widgets/carousel_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Happy reading!',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    size: 30.r,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50.h,
            ),
            Text(
              'Best Deals',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 16.h,
            ),
            const CarouselWidget(),
          ],
        ),
      ),
    );
  }
}
