import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_int/view/user/widgets/catogerory_topics.dart';
import 'package:map_int/view/user/widgets/catogery_search.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view/utilities/custom_text.dart';
import 'package:sizer/sizer.dart';

class catogerory_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wh,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 6.h,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Container(
                    height: 6.h,
                    width: 13.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1.h),
                      color: gy.withOpacity(0.2),
                    ),
                    child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: bl,
                        )),
                  ),
                ),
                catogoery_search(),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  child: all_text(
                      txt: "What to do you  Want to Learn ",
                      col: bl,
                      siz: 15.sp,
                      wei: FontWeight.w400,
                      max: 2),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  child: all_text(
                      txt: "Catogery",
                      col: bl,
                      siz: 13.sp,
                      wei: FontWeight.w700,
                      max: 2),
                ),
              ),
            ),
            catogery_topics(),
          ],
        ),
      ),
    );
  }
}
