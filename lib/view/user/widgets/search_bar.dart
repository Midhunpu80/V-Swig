import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_int/view/user/screens/search_screen/search_result_screen.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:sizer/sizer.dart';

Widget searchbar({required IconData ico, Function()?fun}) {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.all(14.0),
        child: Container(
          height: 6.h,
          width: 80.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1.h),
              color: gy.withOpacity(0.3)),
          child: Center(
            child: TextFormField(
              style: TextStyle(fontSize: 13.sp, color: bl),
              decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(
                      color: bl, fontSize: 14.sp, fontWeight: FontWeight.w400),
                  border: InputBorder.none,
                  prefixIcon: IconButton(
                      onPressed: () {
                      fun!();
                      },
                      icon: Icon(
                        ico,
                        color: bl,
                        size: 4.h,
                      )),
                  suffixIcon: IconButton(
                      onPressed: () {
                        Get.to(() => search_result_screen());
                      },
                      icon: Icon(
                        Icons.close,
                        color: bl,
                      ))),
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () {
          print("save");
        },
        child: Padding(
            padding: const EdgeInsets.all(2),
            child: Container(
              height: 4.h,
              width: 10.w,
              decoration: BoxDecoration(
                color: bl,
                image:
                    const DecorationImage(image: AssetImage("images/bag.png")),
                borderRadius: BorderRadius.circular(1.h),
              ),
            )),
      ),
    ],
  );
}
