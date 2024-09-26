import 'package:flutter/material.dart';

import 'package:bookstore_app/core/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookHorizontalCard extends StatelessWidget {
  const BookHorizontalCard({super.key});

  @override
  Widget build(BuildContext context) {
    const image =
        'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1547955025i/42478640.jpg';

    return Container(
      height: 160.h,
      width: 280.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8).r,
        color: AppColors.primaryColor,
      ),
      child: Row(
        children: [
          Container(
            width: 95.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8).r,
              image: const DecorationImage(
                image: NetworkImage(
                  image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: 170.w,
            padding:
                const EdgeInsets.only(left: 8, right: 16, top: 12, bottom: 12)
                    .r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Novel',
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: AppColors.secondaryColor.withOpacity(0.6),
                      ),
                ),
                Text(
                  'Tuesday Mooney Talks to Ghosts',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: AppColors.secondaryColor,
                      ),
                  overflow: TextOverflow.clip,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'Kate Racculia',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: AppColors.secondaryColor,
                      ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$33.00',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: AppColors.secondaryColor,
                          ),
                    ),
                    Container(
                      height: 22.h,
                      width: 60.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2).r,
                        color: AppColors.secondaryColor,
                      ),
                      child: Center(
                        child: Text(
                          '12% off',
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
