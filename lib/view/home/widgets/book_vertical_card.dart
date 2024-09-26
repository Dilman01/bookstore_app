import 'package:bookstore_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookVerticalCard extends StatelessWidget {
  const BookVerticalCard({super.key});

  @override
  Widget build(BuildContext context) {
    const image =
        'https://npr.brightspotcdn.com/dims4/default/f735808/2147483647/strip/true/crop/363x574+0+0/resize/880x1392!/quality/90/?url=http%3A%2F%2Fnpr-brightspot.s3.amazonaws.com%2Flegacy%2Fsites%2Fwkar%2Ffiles%2Fcatcher_in_the_rye_cover.png';

    return Container(
      height: 294.h,
      width: 180.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8).r,
        color: AppColors.greyColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 140.h,
              width: 92.w,
              padding: const EdgeInsets.only(top: 12).r,
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 154.h,
            width: 180.w,
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 12,
            ).r,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ).r,
              color: AppColors.primaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Classics',
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: AppColors.secondaryColor.withOpacity(0.6),
                      ),
                ),
                Text(
                  'The Catcher in the Rye',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.secondaryColor,
                      ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'J.D,Salinger',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: AppColors.secondaryColor,
                      ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  '\$30.00',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColors.secondaryColor,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
