import 'package:bookstore_app/core/router/router_names.dart';
import 'package:bookstore_app/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    required this.booksList,
  });

  final String title;
  final Future<List<BookModel>> booksList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          InkWell(
            onTap: () async {
              context.pushNamed(RouterNames.seeMore,
                  extra: await booksList,
                  queryParameters: {
                    'title': title,
                  });
            },
            child: Text(
              'See more',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
