// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_int/view/creator/screens/create_course/create_course.dart';
import 'package:map_int/view/user/widgets/starrating.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view/utilities/custom_text.dart';
import 'package:sizer/sizer.dart';

class my_course_screen extends StatelessWidget {
  const my_course_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Courses')
            .where("creator_uid",
                isEqualTo: FirebaseAuth.instance.currentUser?.uid)
            .snapshots(),
        builder: (context, snapshot) {
          final snap = snapshot.data?.docs;
          return Scaffold(
              floatingActionButton: SizedBox(
                width: 40.w,
                height: 7.h,
                child: FloatingActionButton(
                  onPressed: () {
                    Get.to(() => create_course());
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
              body: !snapshot.hasData
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              trailing: IconButton(
                                  onPressed: () {
                                    Get.to(() => create_course());
                                  },
                                  icon: Icon(
                                    Icons.more_horiz_rounded,
                                    color: bl,
                                  )),
                              leading: Container(
                                height: 20.h,
                                width: 14.w,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            snap?[index]['thumbanil'])),
                                    color: gy.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(1.h)),
                              ),
                              title: all_text(
                                  txt: snap?[index]['title'],
                                  col: bl,
                                  siz: 12.sp,
                                  wei: FontWeight.bold,
                                  max: 2),
                              subtitle: all_text(
                                  txt: snap?[index]['creato_name'],
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
                                    txt: "0",
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
                                    txt: "(0)",
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
                                      txt: snap![index]['price'],
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
                      itemCount: snapshot.data!.docs.length));
        });
  }
}
