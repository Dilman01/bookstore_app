import 'package:bookstore_app/view/home/widgets/book_horizontal_card.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  List<Widget> items = [
    const BookHorizontalCard(),
    const BookHorizontalCard(),
    const BookHorizontalCard(),
    const BookHorizontalCard(),
    const BookHorizontalCard(),
    const BookHorizontalCard(),
    const BookHorizontalCard(),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SizedBox(
              height: 160.h,
              width: double.infinity,
              child: CarouselSlider(
                items: items,
                carouselController: _controller,
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  autoPlay: false,
                  padEnds: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: items.asMap().entries.map(
              (entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    height: 8.h,
                    width: 8.w,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 4,
                    ).r,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                          .withOpacity(
                        _current == entry.key ? 0.8 : 0.3,
                      ),
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}
