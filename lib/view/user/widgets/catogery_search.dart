import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:sizer/sizer.dart';

catogoery_search() {
  return Padding(
    padding: EdgeInsets.only(
      left: 1.h,
    ),
    child: Container(
      height: 7.h,
      width: 80.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1.h),
          border: Border.all(width: 1, color: gy)),
      child: Center(
        child: Row(
          children: [
            SizedBox(
              width: 2.h,
            ),
            const CircleAvatar(
              backgroundImage: AssetImage("images/loupe.png"),
            ),
            SizedBox(
              width: 2.h,
            ),
            Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: SizedBox(
                  height: 4.h,
                  width: 60.w,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintStyle: TextStyle(fontSize: 12.sp, color: gy),
                        hintText: "What are you Looking for",
                        border: InputBorder.none),
                  )),
            )
          ],
        ),
      ),
    ),
  );
}
