import 'package:flutter/material.dart';
import 'package:map_int/view/user/widgets/course_details.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view/utilities/custom_text.dart';
import 'package:readmore/readmore.dart';
import 'package:sizer/sizer.dart';

instructor() {
  return Padding(
    padding: const EdgeInsets.all(12),
    child: SizedBox(
      height: 88.h,
      width: 100.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          newtext(
              txt: "Instructor", left: 1.h, siz: 15.sp, wei: FontWeight.bold),
          newtext(
              txt: "7 key solutions",
              left: 1.h,
              siz: 12.sp,
              wei: FontWeight.bold),
          newtext(
              txt: "Learning sand developement",
              left: 1.h,
              siz: 11.sp,
              wei: FontWeight.w400),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 1.h, top: 1.h),
                child: CircleAvatar(
                  radius: 5.h,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 3.h,
                  ),
                  newtext(
                      txt: "4.4,Instructor rating",
                      left: 1.h,
                      siz: 11.sp,
                      wei: FontWeight.w400),
                  newtext(
                      txt: "7,481,Review",
                      left: 1.h,
                      siz: 11.sp,
                      wei: FontWeight.w400),
                  newtext(
                      txt: "31,583 Students",
                      left: 1.h,
                      siz: 11.sp,
                      wei: FontWeight.w400),
                  newtext(
                      txt: "5,Courses",
                      left: 1.h,
                      siz: 11.sp,
                      wei: FontWeight.w400),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 2.h, right: 1.h, top: 2.h),
            child: ReadMoreText(
              'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.' *
                  6,
              trimLines: 29,
              colorClickableText: pp,
              trimMode: TrimMode.Line,
              style: TextStyle(color: bl),
              trimCollapsedText: 'Show more',
              trimExpandedText: 'Show less',
              moreStyle: TextStyle(
                  fontSize: 13.sp, fontWeight: FontWeight.bold, color: bl),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 7.h,
              width: 100.w,
              decoration:
                  BoxDecoration(border: Border.all(width: 2, color: bl)),
              child: Center(
                  child: all_text(
                      txt: "View profile",
                      col: bl,
                      siz: 13.sp,
                      wei: FontWeight.bold,
                      max: 1)),
            ),
          ),
        ],
      ),
    ),
  );
}
