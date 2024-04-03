import 'package:flutter/material.dart';
import 'package:map_int/view/user/widgets/starrating.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view/utilities/custom_text.dart';
import 'package:sizer/sizer.dart';

listof_course_details_result() {
  return SizedBox(
      height: 85.h,
      width: 100.w,
      child: ListView.separated(
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  trailing: Expanded(
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite,
                            color: re,
                          ))),
                  leading: Container(
                    height: 14.h,
                    width: 17.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1.h), color: re),
                  ),
                  title: all_text(
                      txt: "100days code of the complete pythonpro bootcamp",
                      col: bl,
                      siz: 12.sp,
                      wei: FontWeight.bold,
                      max: 6),
                  subtitle: all_text(
                      txt: "Dr.Angelyu",
                      col: bl,
                      siz: 10.sp,
                      wei: FontWeight.w400,
                      max: 2),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 12.h,
                    ),
                    all_text(
                        txt: "4.7",
                        col: yl,
                        siz: 10.sp,
                        wei: FontWeight.w400,
                        max: 2),
                    SizedBox(
                      width: 1.h,
                    ),
                    starratingbar(itemsize: 2.h, initalraiting: 5),
                    SizedBox(
                      width: 1.h,
                    ),
                    all_text(
                        txt: "(279,384)",
                        col: gy,
                        siz: 10.sp,
                        wei: FontWeight.w400,
                        max: 2),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.h),
                  child: SizedBox(
                      child: all_text(
                          txt: "₹549",
                          col: bl,
                          siz: 13.sp,
                          wei: FontWeight.bold,
                          max: 2)),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              thickness: 0,
              color: gy,
            );
          },
          itemCount: 10));
}




// Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         ListTile(
//           leading: Container(
//             height: 14.h,
//             width: 17.w,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(1.h), color: re),
//           ),
//           title: all_text(
//               txt: "100days code of the complete pythonpro bootcamp",
//               col: bl,
//               siz: 12.sp,
//               wei: FontWeight.bold,
//               max: 2),
//           subtitle: all_text(
//               txt: "Dr.Angelyu",
//               col: bl,
//               siz: 10.sp,
//               wei: FontWeight.w400,
//               max: 2),
//         ),
//         Row(
//           children: [
//             SizedBox(
//               width: 12.h,
//             ),
//             all_text(
//                 txt: "4.7", col: yl, siz: 10.sp, wei: FontWeight.w400, max: 2),
//             SizedBox(
//               width: 1.h,
//             ),
//             starratingbar(itemsize: 2.h, initalraiting: 5),
//             SizedBox(
//               width: 1.h,
//             ),
//             all_text(
//                 txt: "(279,384)",
//                 col: gy,
//                 siz: 10.sp,
//                 wei: FontWeight.w400,
//                 max: 2),
//           ],
//         ),
//         Padding(
//           padding: EdgeInsets.only(left: 12.h),
//           child: SizedBox(
//               child: all_text(
//                   txt: "₹549",
//                   col: bl,
//                   siz: 15.sp,
//                   wei: FontWeight.bold,
//                   max: 2)),
//         ),
//       ],
//     ),