import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_int/view/user/screens/authentication/signupscreen.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view/utilities/custom_text.dart';
import 'package:map_int/view_model/pagecontroller/pagecontroller.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'Login_or_singinscreen.dart';

class browse_or_signinscreen extends StatelessWidget {
  final pagess = PageController();
  List<String> images = [
    "images/boxer.jpg",
    "images/sheffs.jpg",
    "images/images.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wh,
      body: Column(
        children: [
          SizedBox(
            height: 4.h,
          ),
          SizedBox(
            height: 80.h,
            width: 100.w,
            child: Stack(
              children: [
                PageView.builder(
                    itemCount: 3,
                    controller: pagess,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            height: 55.h,
                            width: 200.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage(images[index].toString()),
                            )),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          addtexts[index]
                          //  additionnaltext(),
                        ],
                      );
                    }),
                Positioned(
                  bottom: 25.h,
                  child: SizedBox(
                    height: 10.h,
                    width: 100.w,
                    child: Center(
                      child: Padding(
                        padding:
                            EdgeInsets.only(left: 10.h, right: 10.h, top: 2.h),
                        child: SmoothPageIndicator(
                          controller: pagess,
                          count: 3,
                          effect: WormEffect(
                              dotWidth: 1.h,
                              dotHeight: 1.h,
                              dotColor: bl.withOpacity(0.3),
                              activeDotColor: bl),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 6.h,
          ),
          Container(
            height: 10.h,
            width: 120.w,
            color: bl,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () {},
                    child: all_text(
                        txt: "Browse",
                        col: wh,
                        siz: 14.sp,
                        wei: FontWeight.bold,
                        max: 1)),
                TextButton(
                    onPressed: () {
                      Get.to(() =>Login_or_signupscreen());
                    },
                    child: all_text(
                        txt: "Sign In",
                        col: wh,
                        siz: 14.sp,
                        wei: FontWeight.bold,
                        max: 1))
              ],
            ),
          )
        ],
      ),
    );
  }
}

additionnaltext({required var txt1, required var tx2}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      height: 16.h,
      width: 100.w,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            all_text(
                txt: txt1, col: bl, siz: 19.sp, wei: FontWeight.bold, max: 1),
            Padding(
              padding: EdgeInsets.only(left: 2.h, top: 2.h, right: 3.h),
              child: SizedBox(
                  child: all_text(
                      txt: tx2,
                      col: bl,
                      siz: 11.sp,
                      wei: FontWeight.w500,
                      max: 2)),
            )
          ],
        ),
      ),
    ),
  );
}

List addtexts = [
  additionnaltext(
      txt1: "Learn From the Best",
      tx2:
          "Approachable expert-instructors, \n vetted by more than new learners"),
  additionnaltext(
      txt1: "Go at Your Own Pace",
      tx2: "Lifetime acces to purchased\n courses, anytime,anywhere"),
  additionnaltext(
      txt1: "Take Video Courses",
      tx2: "From cooking to Coding and evrything in between")
];
