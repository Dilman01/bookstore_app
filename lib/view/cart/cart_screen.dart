import 'package:bookstore_app/core/common/widgets/custom_button.dart';
import 'package:bookstore_app/core/constants/app_colors.dart';
import 'package:bookstore_app/core/constants/asset_paths.dart';
import 'package:bookstore_app/view/cart/widgets/book_cart_card.dart';
import 'package:bookstore_app/view_model/cart_view_model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartBooks = ref.watch(cartViewModelProvider);
    double subtotal = 0;
    for (final book in cartBooks) {
      subtotal += book.price;
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).r,
        child: cartBooks.isEmpty
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      AssetPaths.emptyCart,
                    ),
                    Text(
                      'Cart is empty.',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 32.h,
                    ),
                    Center(
                      child: Text(
                        'Cart',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: cartBooks.length,
                      separatorBuilder: (context, index) => SizedBox(
                        height: 16.h,
                      ),
                      itemBuilder: (context, index) {
                        final book = cartBooks[index];
                        return BookCartCard(
                          book: book,
                        );
                      },
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Text(
                      'Order Summary',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Subtotal',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          '\$$subtotal',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Shipping',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          '\$10.00',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    const Divider(
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Total',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          '\$${(subtotal + 10).toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    CustomButton(
                      onPressed: () {},
                      title: 'Proceed to Checkout',
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: AppColors.secondaryColor,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
