import 'package:bookstore_app/core/constants/app_colors.dart';
import 'package:bookstore_app/view/home/widgets/book_vertical_card.dart';
import 'package:bookstore_app/view/home/widgets/carousel_widget.dart';
import 'package:bookstore_app/view/home/widgets/section_header.dart';
import 'package:bookstore_app/view_model/home_view_model/home_view_model.dart';
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
        child: SingleChildScrollView(
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
              FutureBuilder(
                future:
                    ref.watch(homeViewModelProvider.notifier).getBestDeals(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    );
                  }

                  return CarouselWidget(
                    bestBooks: snapshot.data!,
                  );
                },
              ),
              SizedBox(
                height: 50.h,
              ),
              SectionHeader(
                title: 'Top Books',
                booksList:
                    ref.watch(homeViewModelProvider.notifier).getTopBooks(),
              ),
              SizedBox(
                height: 32.h,
              ),
              FutureBuilder(
                future: ref.watch(homeViewModelProvider.notifier).getTopBooks(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    );
                  }
                  return SizedBox(
                    height: 294.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(right: 20).r,
                      shrinkWrap: true,
                      itemCount: 4,
                      separatorBuilder: (context, index) => SizedBox(
                        width: 16.w,
                      ),
                      itemBuilder: (context, index) {
                        final book = snapshot.data![index];
                        return BookVerticalCard(
                          book: book,
                        );
                      },
                    ),
                  );
                },
              ),
              SizedBox(
                height: 50.h,
              ),
              SectionHeader(
                title: 'Latest Books',
                booksList:
                    ref.watch(homeViewModelProvider.notifier).getLatestBooks(),
              ),
              SizedBox(
                height: 32.h,
              ),
              FutureBuilder(
                future:
                    ref.watch(homeViewModelProvider.notifier).getLatestBooks(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    );
                  }
                  return SizedBox(
                    height: 294.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(right: 20).r,
                      shrinkWrap: true,
                      itemCount: 4,
                      separatorBuilder: (context, index) => SizedBox(
                        width: 16.w,
                      ),
                      itemBuilder: (context, index) {
                        final book = snapshot.data![index];
                        return BookVerticalCard(
                          book: book,
                        );
                      },
                    ),
                  );
                },
              ),
              SizedBox(
                height: 50.h,
              ),
              SectionHeader(
                title: 'Upcoming Books',
                booksList: ref
                    .watch(homeViewModelProvider.notifier)
                    .getUpcomingBooks(),
              ),
              SizedBox(
                height: 32.h,
              ),
              FutureBuilder(
                future: ref
                    .watch(homeViewModelProvider.notifier)
                    .getUpcomingBooks(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    );
                  }
                  return SizedBox(
                    height: 294.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(right: 20).r,
                      shrinkWrap: true,
                      itemCount: 4,
                      separatorBuilder: (context, index) => SizedBox(
                        width: 16.w,
                      ),
                      itemBuilder: (context, index) {
                        final book = snapshot.data![index];
                        return BookVerticalCard(
                          book: book,
                        );
                      },
                    ),
                  );
                },
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
