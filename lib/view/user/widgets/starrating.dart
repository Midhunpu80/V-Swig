import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:sizer/sizer.dart';

starratingbar({required double itemsize, required double initalraiting}) {
  return Container(
    height: 5.h,
    width: 20.w,
    child: Center(
      child: RatingBar.builder(
        unratedColor: gy,
        itemSize: itemsize,
        initialRating: initalraiting,
        minRating: 1,
        direction: Axis.vertical,
        allowHalfRating: true,
        itemCount: 5,
        itemPadding: EdgeInsets.only(
          top: 1.h,
          bottom: 1.h,
        ),
        itemBuilder: (context, _) => const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: (rating) {
          print(rating);
        },
      ),
    ),
  );
}
