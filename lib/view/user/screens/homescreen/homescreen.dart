import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_int/view/user/screens/catogeryscreen.dart/catogery_screen.dart';
import 'package:map_int/view/user/screens/popular_course_screen/popular_course_screen.dart';
import 'package:map_int/view/user/screens/shopping_cart_screen/shopping_cart_screen.dart';
import 'package:map_int/view/user/widgets/Home_top_nvabar.dart';
import 'package:map_int/view/user/widgets/home_carousal_slider.dart';
import 'package:map_int/view/user/widgets/home_catogeory.dart';
import 'package:map_int/view/user/widgets/home_popular_course.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view/utilities/custom_text.dart';
import 'package:sizer/sizer.dart';

class homescreen extends StatelessWidget {
  const homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: all_text(
            txt: "Welcome ", col: bl, siz: 18.sp, wei: FontWeight.bold, max: 1),
        backgroundColor: wh,
        actions: [
          InkWell(
            onTap: () {
              Get.to(() => shopping_cart_screen());
            },
            child: Padding(
                padding: const EdgeInsets.all(2),
                child: Container(
                  height: 3.h,
                  width: 12.w,
                  decoration: BoxDecoration(
                    color: bl,
                    image: const DecorationImage(
                        image: AssetImage("images/bag.png")),
                    borderRadius: BorderRadius.circular(1.h),
                  ),
                )),
          ),
          InkWell(
            onTap: () {
              //  Get.to(()=>)
            },
            child: Padding(
                padding: const EdgeInsets.all(2),
                child: Container(
                  height: 3.h,
                  width: 12.w,
                  decoration: BoxDecoration(
                    color: bl,
                    image: const DecorationImage(
                        image: AssetImage("images/bell.png")),
                    borderRadius: BorderRadius.circular(1.h),
                  ),
                )),
          )
        ],
      ),
      backgroundColor: wh,
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Courses').snapshots(),
          builder: (context, snapshot) {
            final snap = snapshot.data?.docs;

            return !snapshot.hasData
                ?const  Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 3.h,
                        ),
                        home_top_navbar(),
                        SizedBox(
                          height: 1.h,
                        ),
                        home_carousal_slider(),
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 2.h),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: SizedBox(
                              child: all_text(
                                  txt: "Keep Moving up",
                                  col: bl,
                                  siz: 21.sp,
                                  wei: FontWeight.bold,
                                  max: 1),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 2.h, right: 1.h),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: SizedBox(
                              child: all_text(
                                  txt:
                                      "Learn the skills you need to take next step - and evry step after courses from 499 only",
                                  col: bl,
                                  siz: 13.sp,
                                  wei: FontWeight.w400,
                                  max: 3),
                            ),
                          ),
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
                                onPressed: () {
                                  Get.to(() => catogerory_screen());
                                },
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
                                onPressed: () {
                                  Get.to(() => popular_course_screen());
                                },
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
                        home_popular_course(snap: snap,length: snapshot.data!.docs.length,indexa: 0),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              all_text(
                                  txt: "Web development Courses",
                                  col: bl,
                                  siz: 12.sp,
                                  wei: FontWeight.bold,
                                  max: 1),
                              TextButton(
                                onPressed: () {
                                  Get.to(() => popular_course_screen());
                                },
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
                        home_popular_course(snap: snap,length: snapshot.data!.docs.length,indexa: 0),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              all_text(
                                  txt: "cooking Courses",
                                  col: bl,
                                  siz: 12.sp,
                                  wei: FontWeight.bold,
                                  max: 1),
                              TextButton(
                                onPressed: () {
                                  Get.to(() => popular_course_screen());
                                },
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
                        //home_popular_course(snap: snap,length: snapshot.data!.docs.length),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              all_text(
                                  txt: "Boxing courses",
                                  col: bl,
                                  siz: 12.sp,
                                  wei: FontWeight.bold,
                                  max: 1),
                              TextButton(
                                onPressed: () {
                                  Get.to(() => popular_course_screen());
                                },
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
                       // home_popular_course(snap: snap,length: snapshot.data!.docs.length),
                      ],
                    ),
                  );
          }),
    );
  }
}
