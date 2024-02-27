import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view/utilities/custom_text.dart';
import 'package:sizer/sizer.dart';

home_popular_course() {
  return Container(
    height: 28.h,
    width: 100.w,
    child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.h),
                  color: wh,
                  border: Border.all(width: 1, color: gy.withOpacity(0.2))),
              height: 35.h,
              width: 50.w,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 15.h,
                      width: 66.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.h), color: blu),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      all_text(
                          txt: "Ui/ux designing ",
                          col: bl,
                          siz: 10.sp,
                          wei: FontWeight.w800,
                          max: 1),
                      all_text(
                          txt: "₹150",
                          col: blu,
                          siz: 10.sp,
                          wei: FontWeight.bold,
                          max: 1),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 2.h,
                      ),
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: bl,
                      ),
                      SizedBox(
                        width: 1.h,
                      ),
                      all_text(
                          txt: "warrenbuffet",
                          col: bl,
                          siz: 10.sp,
                          wei: FontWeight.bold,
                          max: 1),
                    ],
                  ),
                  Row(
                    children: [
                       SizedBox(
                        width: 2.h,
                      ),
                      all_text(
                          txt: "13 lessons",
                          col: bl,
                          siz: 9.sp,
                          wei: FontWeight.bold,
                          max: 1),
                    ],
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox();
        },
        itemCount: 20),
  );
}
