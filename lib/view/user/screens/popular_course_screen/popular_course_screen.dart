import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_int/view/user/widgets/popular_courses_gridview.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view/utilities/custom_text.dart';
import 'package:sizer/sizer.dart';

class popular_course_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wh,
      appBar: AppBar(
        backgroundColor: wh,
        actions: [
          IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                radius: 13,
                backgroundColor: bl,
                backgroundImage: const AssetImage("images/bell.png"),
              )),
          IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                radius: 13,
                backgroundColor: bl,
                backgroundImage: const AssetImage("images/bag.png"),
              ))
        ],
        elevation: 0,
        toolbarHeight: 10.h,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: bl,
          ),
        ),
        title: all_text(
            txt: "Popular Courses",
            col: bl,
            siz: 13.sp,
            wei: FontWeight.w400,
            max: 1),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Courses').snapshots(),
          builder: (context, snapshot) {
            final snap = snapshot.data?.docs;
            return Column(
              children: [
                popualar_course_gridview(snap: snap ,length: snapshot.data!.docs.length),
              ],
            );
          }),
    );
  }
}
