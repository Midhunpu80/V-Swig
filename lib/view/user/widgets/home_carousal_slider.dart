import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

home_carousal_slider() {
  return CarouselSlider(
    options: CarouselOptions(height: 170.0),
    items: [1, 2, 3, 4, 5].map((i) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
                color: Colors.amber, borderRadius: BorderRadius.circular(2.h)),
          );
        },
      );
    }).toList(),
  );
}
