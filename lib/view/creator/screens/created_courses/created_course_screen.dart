// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_int/view/creator/screens/create_course/create_course.dart';
import 'package:map_int/view/user/widgets/starrating.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view/utilities/custom_text.dart';
import 'package:sizer/sizer.dart';

class created_course_screen extends StatelessWidget {
  const created_course_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: SizedBox(
          width: 40.w,
          height: 7.h,
          child: FloatingActionButton(
            onPressed: () {
              Get.to(() => const create_course());
            },
            child: Row(
              children: [
                SizedBox(
                  width: 4.w,
                ),
                const Icon(
                  Icons.add,
                ),
                all_text(
                    txt: "create Course",
                    col: wh,
                    siz: 12.sp,
                    wei: FontWeight.w600,
                    max: 1)
              ],
            ),
          ),
        ),
        backgroundColor: wh,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  ///  Get.to(() => create_course());
                },
                icon: Icon(
                  Icons.more_vert,
                  color: bl,
                ))
          ],
          toolbarHeight: 10.h,
          centerTitle: true,
          title: all_text(
              txt: "My Courses",
              col: bl,
              siz: 13.sp,
              wei: FontWeight.bold,
              max: 1),
          backgroundColor: wh,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.menu,
                color: bl,
              )),
        ),
        // ignore: prefer_const_constructors
        body: ListView.separated(
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    trailing: IconButton(
                        onPressed: () {
                          Get.to(() => const create_course());
                        },
                        icon: Icon(
                          Icons.more_horiz_rounded,
                          color: bl,
                        )),
                    leading: Container(
                      height: 20.h,
                      width: 14.w,
                      decoration: BoxDecoration(
                          color: gy.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(1.h)),
                    ),
                    title: all_text(
                        txt: "100days code of the complete pythonpro bootcamp",
                        col: bl,
                        siz: 12.sp,
                        wei: FontWeight.bold,
                        max: 2),
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
                            col: pp,
                            siz: 13.sp,
                            wei: FontWeight.bold,
                            max: 2)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12.h, top: 1.h),
                    child: Container(
                      height: 3.h,
                      width: 20.w,
                      color: gr,
                      child: Center(
                          child: all_text(
                              txt: "Updated",
                              col: bl,
                              siz: 9.sp,
                              wei: FontWeight.w800,
                              max: 1)),
                    ),
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
}
