import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view/utilities/custom_text.dart';
import 'package:sizer/sizer.dart';

catogery_topics() {
  var generatedColor = Random().nextInt(Colors.primaries.length);
  Colors.primaries[generatedColor];
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      height: 70.h,
      width: 100.w,
      child: GridView.builder(
        itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 1.h,
              mainAxisSpacing: 1.h,
              childAspectRatio: 0.7),
          itemBuilder: (context, index) {
            return Container(
                height: 50.h,
                width: 80.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.h),
                    color: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)]),
                child: Column(
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    all_text(
                        txt: "Programing",
                        col: wh,
                        siz: 15.sp,
                        wei: FontWeight.bold,
                        max: 1),
                  ],
                ));
          }),
    ),
  );
}
