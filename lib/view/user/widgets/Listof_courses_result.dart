import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:map_int/main.dart';
import 'package:map_int/view/user/widgets/starrating.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view/utilities/custom_text.dart';
import 'package:sizer/sizer.dart';

listof_course_details_result(
    {required List<QueryDocumentSnapshot<Map<String, dynamic>>>? snap}) {
  return snap!.isEmpty
      ? Center(
          child: Column(
            children: [
              SizedBox(
                height: 29.h,
              ),
              Icon(
                Icons.favorite,
                color: gy.withOpacity(0.2),
                size: 7.h,
              ),
              SizedBox(height: 2.h,),
              all_text(
                  txt: "ADD YOUR FAV WISHES",
                  col: bl.withOpacity(0.3),
                  siz: 15.sp,
                  wei: FontWeight.bold,
                  max: 6)
            ],
          ),
        )
      : SizedBox(
          height: 85.h,
          width: 100.w,
          child: ListView.separated(
              itemBuilder: (context, index) {
                final newsnap = snap[index];

                wishList_controll.isadded.value = false;

                if (snap != null && snap!.isNotEmpty) {
                  if (snap[index]['course_id'] == newsnap['course_id']) {
                    // Update the value of isadded accordingly
                    wishList_controll.isadded.value = true;
                  }
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      trailing: IconButton(
                          onPressed: () {
                            wishList_controll.addfav(
                              istrue: wishList_controll.isadded.value,
                              title: newsnap['title'],
                              rating: newsnap['rating'],
                              subtitle: newsnap['subtitle'],
                              reviews: newsnap['reviews'],
                              language: newsnap['language'],
                              price: newsnap['price'],
                              course_id: newsnap['course_id'],
                              students: newsnap['students'],
                              thumbnail: newsnap['thumbanil'],
                              description: newsnap['description'],
                              catogery: newsnap['catogery_name'],
                              catogery_id: newsnap['catogery_id'],
                              creator: newsnap['creato_name'],
                              creator_emailaddress: newsnap['creator_email'],
                              creator_id: newsnap['creator_uid'],
                            );
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: re,
                          )),
                      leading: Container(
                        height: 14.h,
                        width: 17.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(newsnap['thumbanil']),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(1.h),
                            color: gy),
                      ),
                      title: all_text(
                          txt: "${newsnap['title']}",
                          col: bl,
                          siz: 12.sp,
                          wei: FontWeight.bold,
                          max: 6),
                      subtitle: all_text(
                          txt: "${newsnap['creato_name']}",
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
                            txt: "${newsnap['rating']}",
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
                            txt: "(${newsnap['reviews']})",
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
                              txt: "₹${newsnap['price']}",
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
              itemCount: snap!.length));
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