// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:map_int/view/user/widgets/instructor.dart';

import 'package:map_int/view/user/widgets/starrating.dart';
import 'package:map_int/view/user/widgets/student_feedback.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view/utilities/custom_text.dart';
import 'package:readmore/readmore.dart';
import 'package:sizer/sizer.dart';

course_details() {
  return SliverAppBar(
    backgroundColor: wh,
    toolbarHeight: 380.h,
    leading: const Icon(
      Icons.abc,
      color: Colors.transparent,
    ),
    flexibleSpace: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: 23.h,
            width: 100.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1.h), color: blu),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 2.h),
          child: SizedBox(
            child: all_text(
                txt: "Crash course elctronics \nand pcb design ",
                col: bl,
                siz: 17.sp,
                wei: FontWeight.w600,
                max: null),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 2.h, top: 1.h),
          child: SizedBox(
            height: 5.h,
            width: 80.w,
            child: all_text(
                txt:
                    "Crash courseelctronicsnnbbnnnnbnbbnbnnbnbnbnnbn nbfkfbbdbdbdbdbdbbdbband pcb design "
                        .toUpperCase(),
                col: bl,
                siz: 10.sp,
                wei: FontWeight.w500,
                max: 3),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 2.h, top: 1.h),
          child: Container(
            height: 3.h,
            width: 15.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: gr),
            child: Center(
              child: all_text(
                  txt: "seller",
                  col: wh,
                  siz: 10.sp,
                  wei: FontWeight.bold,
                  max: 1),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 2.h, top: 1.h),
          child: Row(
            children: [
              all_text(
                  txt: "4.7   ",
                  col: bl,
                  siz: 10.sp,
                  wei: FontWeight.bold,
                  max: 1),
              starratingbar(itemsize: 2.h, initalraiting: 4)
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.only(
              left: 2.h,
            ),
            child: SizedBox(
                child: all_text(
                    txt: "(1418 rating)81,students",
                    col: bl,
                    siz: 9.sp,
                    wei: FontWeight.w500,
                    max: 3))),
        Padding(
            padding: EdgeInsets.only(left: 2.h, top: 1.h),
            child: SizedBox(
                child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Created by  ',
                    style: TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 9.sp, color: bl),
                  ),
                  TextSpan(
                    text: 'AndreL mothe',
                    style: TextStyle(fontWeight: FontWeight.bold, color: pp),
                  ),
                ],
              ),
            ))),
        SizedBox(
          height: 1.h,
        ),
        bulletpoint(ico: Icons.update, label: "Last updated"),
        bulletpoint(ico: Icons.language, label: "English"),
        bulletpoint(ico: Icons.subtitles, label: "English"),
        SizedBox(
          height: 2.h,
        ),
        newtext(txt: "₹ 499", left: 2.h, siz: 20.sp, wei: FontWeight.bold),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 6.h,
            width: 100.w,
            color: pp,
            child: Center(
                child: all_text(
                    txt: "Buy now",
                    col: bl,
                    siz: 15.sp,
                    wei: FontWeight.bold,
                    max: 1)),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 6.h,
              width: 45.w,
              decoration:
                  BoxDecoration(border: Border.all(width: 2, color: bl)),
              child: Center(
                child: all_text(
                    txt: "Add to Cart",
                    col: bl,
                    siz: 12.sp,
                    wei: FontWeight.bold,
                    max: 1),
              ),
            ),
            Container(
              height: 6.h,
              width: 45.w,
              decoration:
                  BoxDecoration(border: Border.all(width: 2, color: bl)),
              child: Center(
                  child: all_text(
                      txt: "Add to Whishlist",
                      col: bl,
                      siz: 12.sp,
                      wei: FontWeight.bold,
                      max: 1)),
            )
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        InkWell(
          onTap: () {
            print("curriculam");
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 5.h,
              width: 100.w,
              decoration:
                  BoxDecoration(border: Border.all(width: 2, color: bl)),
              child: Center(
                  child: all_text(
                      txt: "Curriculam",
                      col: bl,
                      siz: 12.sp,
                      wei: FontWeight.bold,
                      max: 1)),
            ),
          ),
        ),
        newtext(
            txt: "Description", left: 2.h, siz: 13.sp, wei: FontWeight.bold),
        Padding(
          padding: EdgeInsets.only(left: 2.h, right: 1.h, top: 2.h),
          child: ReadMoreText(
            'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.' *
                12,
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
        instructor(),
        student_feedback(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 7.h,
            width: 100.w,
            decoration: BoxDecoration(border: Border.all(width: 2, color: bl)),
            child: Center(
                child: all_text(
                    txt: "See More Reviews",
                    col: bl,
                    siz: 13.sp,
                    wei: FontWeight.bold,
                    max: 1)),
          ),
        ),
      ],
    ),
  );
}

bulletpoint({required IconData ico, required var label}) {
  return Padding(
    padding: EdgeInsets.only(left: 2.h, top: 1.h),
    child: Row(
      children: [
        Icon(
          ico,
          size: 2.h,
          color: bl,
        ),
        SizedBox(
          width: 1.h,
        ),
        all_text(txt: label, col: bl, siz: 10.sp, wei: FontWeight.w400, max: 1)
      ],
    ),
  );
}

newtext(
    {required var txt,
    required double left,
    required double siz,
    required var wei}) {
  return Padding(
    padding: EdgeInsets.only(left: left, top: 1.h),
    child: SizedBox(
        child: all_text(txt: txt, col: bl, siz: siz, wei: wei, max: 1)),
  );
}
