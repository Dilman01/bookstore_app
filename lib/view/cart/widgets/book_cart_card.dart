import 'package:flutter/material.dart';

import 'package:bookstore_app/core/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookCartCard extends StatelessWidget {
  const BookCartCard({super.key});

  @override
  Widget build(BuildContext context) {
    const image =
        'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1547955025i/42478640.jpg';

    return Container(
      height: 144.h,
      width: 320.w,
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
            width: 220.w,
            padding: const EdgeInsets.only(
              left: 10,
              right: 8,
              top: 8,
              bottom: 8,
            ).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Novel',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: AppColors.secondaryColor.withOpacity(0.6),
                          ),
                    ),
                    Icon(
                      Icons.close,
                      color: AppColors.secondaryColor,
                      size: 20.r,
                    ),
                  ],
                ),
                Text(
                  'Tuesday Mooney Talks to Ghosts',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: AppColors.secondaryColor,
                      ),
                  overflow: TextOverflow.clip,
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  'Kate Racculia',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: AppColors.secondaryColor,
                      ),
                ),
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 24.h,
                          width: 24.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5).r,
                            color: AppColors.secondaryColor,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.remove,
                              size: 24.r,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          '1',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: AppColors.secondaryColor,
                                  ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Container(
                          height: 24.h,
                          width: 24.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5).r,
                            color: AppColors.secondaryColor,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              size: 24.r,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '\$33.00',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: AppColors.secondaryColor,
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
