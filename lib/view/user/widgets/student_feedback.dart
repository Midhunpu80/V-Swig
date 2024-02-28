import 'package:flutter/material.dart';
import 'package:map_int/view/user/widgets/course_details.dart';
import 'package:map_int/view/user/widgets/starrating.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view/utilities/custom_text.dart';
import 'package:readmore/readmore.dart';
import 'package:sizer/sizer.dart';

// ignore: non_constant_identifier_names
student_feedback() {
  return Padding(
    padding: const EdgeInsets.all(11.0),
    child: Container(
      height: 80.h,
      width: 100.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          newtext(
              txt: "Student Feedback",
              left: 2.h,
              siz: 15.sp,
              wei: FontWeight.bold),
          SizedBox(
            height: 1.h,
          ),
          newtext(
              txt: "4.3 course rating",
              left: 2.h,
              siz: 15.sp,
              wei: FontWeight.w400),
          SizedBox(
            height: 2.h,
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        all_text(
                            txt: "Tracy freeman ",
                            col: bl,
                            siz: 12.sp,
                            wei: FontWeight.bold,
                            max: 1),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 4.h,
                            width: 100.w,
                            child: Row(
                              children: [
                                starratingbar(itemsize: 2.h, initalraiting: 5),
                                SizedBox(
                                  width: 2.h,
                                ),
                                all_text(
                                    txt: "2 weeks",
                                    col: gy,
                                    siz: 10.sp,
                                    wei: FontWeight.w400,
                                    max: 1)
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 2.h, right: 1.h, top: 2.h),
                          child: ReadMoreText(
                            'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.' *
                                2,
                            trimLines: 2,
                            colorClickableText: pp,
                            trimMode: TrimMode.Line,
                            style: TextStyle(color: bl),
                            trimCollapsedText: 'Show more',
                            trimExpandedText: 'Show less',
                            moreStyle: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold,
                                color: bl),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox();
                },
                itemCount: 3),
          )
        ],
      ),
    ),
  );
}
