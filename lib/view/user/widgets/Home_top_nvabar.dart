import 'package:flutter/material.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view/utilities/custom_text.dart';
import 'package:sizer/sizer.dart';

home_top_navbar() {
  return Container(
    height: 8.h,
    width: 100.w,
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 5.h,
            width: 12.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1.h), color: re),
          ),
        ),
        all_text(
            txt: "Midhun pu ",
            col: bl,
            siz: 12.sp,
            wei: FontWeight.w600,
            max: 1),
        Spacer(),
        Padding(
            padding: const EdgeInsets.all(2),
            child: Container(
              height: 3.h,
              width: 12.w,
              decoration: BoxDecoration(
                image:
                    const DecorationImage(image: AssetImage("images/bag.png")),
                borderRadius: BorderRadius.circular(1.h),
              ),
            )),
        Padding(
            padding: const EdgeInsets.all(2),
            child: Container(
              height: 3.h,
              width: 12.w,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage("images/loupe.png")),
                borderRadius: BorderRadius.circular(1.h),
              ),
            )),
        Padding(
            padding: const EdgeInsets.all(2),
            child: Container(
              height: 3.h,
              width: 12.w,
              decoration: BoxDecoration(
                image:
                    const DecorationImage(image: AssetImage("images/bell.png")),
                borderRadius: BorderRadius.circular(1.h),
              ),
            ))
      ],
    ),
  );
}
