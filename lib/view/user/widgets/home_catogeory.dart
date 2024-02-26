import 'package:flutter/material.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view/utilities/custom_text.dart';
import 'package:sizer/sizer.dart';

home_catogery() {
  return Container(
    decoration: BoxDecoration(),
    height: 8.h,
    width: 100.w,
    child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                height: 5.h,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: gy.withOpacity(0.8),
                        blurRadius: 5.5,
                        offset: Offset(10, 3),
                        spreadRadius: 0.6)
                  ],
                  color: wh,
                  borderRadius: BorderRadius.circular(285.h),
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage("images/house.png"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: all_text(
                            txt: "wev",
                            col: bl,
                            siz: 12.sp,
                            wei: FontWeight.bold,
                            max: 1),
                      ),
                    ),
                  ],
                ),
              ));
        },
        separatorBuilder: (context, index) {
          return SizedBox();
        },
        itemCount: 20),
  );
}
