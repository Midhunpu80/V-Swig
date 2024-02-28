import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:map_int/view/user/screens/view_course_details/view_details_course_screen.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view/utilities/custom_text.dart';
import 'package:sizer/sizer.dart';

popualar_course_gridview() {
  return Container(
    height: 85.h,
    width: 100.w,
    child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.7),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.to(() => view_course_details_screen());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(2, 6),
                          blurRadius: 0.10,
                          spreadRadius: 0.5,
                          color: gy.withOpacity(0.2))
                    ],
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
                            borderRadius: BorderRadius.circular(2.h),
                            color: blu),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        all_text(
                            txt: "Ui/ux designing the 201 \ncan bridege ",
                            col: bl,
                            siz: 10.sp,
                            wei: FontWeight.w800,
                            max: 2),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 1.h,
                        ),
                        SizedBox(
                          width: 1.h,
                        ),
                        all_text(
                            txt: "warrenbuffet",
                            col: gy,
                            siz: 9.sp,
                            wei: FontWeight.bold,
                            max: 1),
                        SizedBox(
                          width: 4.h,
                        ),
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
                        all_text(
                            txt: "13 lessons",
                            col: bl,
                            siz: 9.sp,
                            wei: FontWeight.bold,
                            max: 1),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 3.h,
                        ),
                        all_text(
                            txt: "4.2",
                            col: bl,
                            siz: 10.sp,
                            wei: FontWeight.w400,
                            max: 1),
                        SizedBox(
                          width: 1.h,
                        ),
                        Container(
                          height: 5.h,
                          width: 20.w,
                          child: Center(
                            child: RatingBar.builder(
                              itemSize: 2.h,
                              initialRating: 3,
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
                        ),
                        SizedBox(
                          width: 1.h,
                        ),
                        all_text(
                            txt: "(14k)",
                            col: gy,
                            siz: 10.sp,
                            wei: FontWeight.w400,
                            max: 1),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
  );
}
