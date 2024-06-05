import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view/utilities/custom_text.dart';
import 'package:sizer/sizer.dart';

class instructor_profile_screen extends StatelessWidget {
  String? name;
  String? bio;
  String? profile;
  String? courses;
  String? students;
  String? reviews;
  String ?email;
  instructor_profile_screen({
    required this.bio,
    required this.courses,
    required this.name,
    required this.profile,
    required this.reviews,
    required this.students,
    required this.email
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wh,
      appBar: AppBar(
        toolbarHeight: 10.h,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: bl,
            )),
        backgroundColor: wh,
        title: all_text(
            txt: "INSTRUCTOR",
            col: bl,
            siz: 12.sp,
            wei: FontWeight.bold,
            max: 1),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          ///  mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(radius: 8.h,backgroundImage: NetworkImage(profile.toString()),),
            SizedBox(
              height: 1.h,
            ),
            all_text(
                txt: name, col: bl, siz: 21.sp, wei: FontWeight.bold, max: 1),
            all_text(
                txt: email, col: bl, siz: 12.sp, wei: FontWeight.bold, max: 1),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  usedcontainer(
                      txt: "students(${students.toString()})",
                      icon: Icons.person),
                  usedcontainer(
                      txt: "Rating(${courses.toString()})", icon: Icons.star),
                  usedcontainer(
                      txt: "Reviews(${reviews.toString()})",
                      icon: Icons.all_inbox),
                ],
              ),
            ),
            Container(
                height: 40.h,
                width: 100.w,
                child: Padding(
                  padding: EdgeInsets.all(2.h),
                  child: Center(
                      child: all_text(
                          txt: bio,
                          col: bl,
                          siz: 11.sp,
                          wei: FontWeight.bold,
                          max: null)),
                )),
          ],
        ),
      ),
    );
  }
}

usedcontainer({required var txt, required IconData icon}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 5.h,
      width: 28.w,

      //  decoration: BoxDecoration(borderRadius: BorderRadius.circular(2.h),color: bl),
      child: TextButton.icon(
        onPressed: () {},
        label: all_text(
            txt: txt, col: bl, siz: 8.sp, wei: FontWeight.bold, max: 1),
        icon: Icon(
          icon,
          color: bl,
          size: 2.h,
        ),
      ),
    ),
  );
}
