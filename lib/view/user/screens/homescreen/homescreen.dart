import 'package:flutter/material.dart';
import 'package:map_int/view/user/widgets/Home_top_nvabar.dart';
import 'package:map_int/view/user/widgets/home_carousal_slider.dart';
import 'package:map_int/view/user/widgets/home_catogeory.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view/utilities/custom_text.dart';
import 'package:sizer/sizer.dart';

class homescreen extends StatelessWidget {
  const homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 3.h,
          ),
          home_top_navbar(),
          SizedBox(
            height: 3.h,
          ),
          home_carousal_slider(),
          SizedBox(
            height: 2.h,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                all_text(
                    txt: "Catogories",
                    col: bl,
                    siz: 12.sp,
                    wei: FontWeight.bold,
                    max: 1),
                TextButton(
                  onPressed: () {},
                  child: all_text(
                      txt: "View all",
                      col: blu,
                      siz: 11.sp,
                      wei: FontWeight.bold,
                      max: 1),
                )
              ],
            ),
          ),
          home_catogery(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                all_text(
                    txt: "Popular Courses",
                    col: bl,
                    siz: 12.sp,
                    wei: FontWeight.bold,
                    max: 1),
                TextButton(
                  onPressed: () {},
                  child: all_text(
                      txt: "View all",
                      col: blu,
                      siz: 11.sp,
                      wei: FontWeight.bold,
                      max: 1),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
