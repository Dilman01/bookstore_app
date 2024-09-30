import 'package:bookstore_app/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

import 'package:bookstore_app/core/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookHorizontalCard extends StatelessWidget {
  const BookHorizontalCard({
    super.key,
    required this.book,
  });

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
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
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ).r,
              image: DecorationImage(
                image: NetworkImage(
                  book.imageUrl,
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
                  book.category,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: AppColors.secondaryColor.withOpacity(0.6),
                      ),
                ),
                Text(
                  book.title,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: AppColors.secondaryColor,
                      ),
                  overflow: TextOverflow.clip,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  book.author,
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
                      '\$${book.price}',
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
                          '${book.discount ?? 10} off',
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
