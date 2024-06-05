import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_int/main.dart';

import 'package:map_int/view/user/widgets/search_bar.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view/utilities/custom_text.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/starrating.dart';


class search_result_screen extends StatelessWidget {
  final list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wh,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 3.h,
            ),
            searchbar(ico: Icons.arrow_back, fun: back),
            //    listof_course_details_result(snap: [])
            Obx(
              () => search_product_controll.showdata.value.isEmpty
                  ? Center(
                      child: all_text(
                          txt: "result not Found",
                          col: bl,
                          siz: 12.sp,
                          wei: FontWeight.bold,
                          max: 1),
                    )
                  : SizedBox(
                      height: 85.h,
                      width: 100.w,
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            final data =
                                search_product_controll.showdata.value[index];
                            // final list = mydata.toList();
                            // final data = list[index];

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  // trailing: IconButton(
                                  //     onPressed: () {
                                  //       // wishList_controll.addfav(
                                  //       //   istrue: wishList_controll.isadded.value,
                                  //       //   title: newsnap['title'],
                                  //       //   rating: newsnap['rating'],
                                  //       //   subtitle: newsnap['subtitle'],
                                  //       //   reviews: newsnap['reviews'],
                                  //       //   language: newsnap['language'],
                                  //       //   price: newsnap['price'],
                                  //       //   course_id: newsnap['course_id'],
                                  //       //   students: newsnap['students'],
                                  //       //   thumbnail: newsnap['thumbanil'],
                                  //       //   description: newsnap['description'],
                                  //       //   catogery: newsnap['catogery_name'],
                                  //       //   catogery_id: newsnap['catogery_id'],
                                  //       //   creator: newsnap['creato_name'],
                                  //       //   creator_emailaddress: newsnap['creator_email'],
                                  //       //   creator_id: newsnap['creator_uid'],
                                  //       // );
                                  //     },
                                  //     icon: Icon(
                                  //       Icons.favorite,
                                  //       color: re,
                                  //     )),
                                  leading: Container(
                                    height: 14.h,
                                    width: 17.w,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(data['image']),
                                            fit: BoxFit.cover),
                                        borderRadius:
                                            BorderRadius.circular(1.h),
                                        color: gy),
                                  ),
                                  title: all_text(
                                      txt: data['name'],
                                      col: bl,
                                      siz: 12.sp,
                                      wei: FontWeight.bold,
                                      max: 6),
                                  subtitle: all_text(
                                      txt: data['subtitle'],
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
                                        txt: data['rating'],
                                        col: yl,
                                        siz: 10.sp,
                                        wei: FontWeight.w400,
                                        max: 2),
                                    SizedBox(
                                      width: 1.h,
                                    ),
                                    starratingbar(
                                        itemsize: 2.h, initalraiting: 5),
                                    SizedBox(
                                      width: 1.h,
                                    ),
                                    all_text(
                                        txt: data['reviews'],
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
                                          txt: " ₹ ${data['price']}",
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
                          itemCount:
                              search_product_controll.showdata.toSet().length)),
            )
          ],
        ),
      ),
    );
  }
}

back() {
  Get.back();
}
