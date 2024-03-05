// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_int/view/creator/screens/upload_video_screen/upload_videos_screen.dart';
import 'package:map_int/view/user/widgets/descritption.dart';
import 'package:map_int/view/user/widgets/textform_filed.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view/utilities/custom_text.dart';
import 'package:sizer/sizer.dart';

class create_course extends StatelessWidget {
  const create_course({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wh,
      appBar: AppBar(
        backgroundColor: wh,
        leading: Icon(
          Icons.menu,
          color: bl,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            all_text(
                txt: "Upload thumbnail",
                col: bl,
                siz: 12.sp,
                wei: FontWeight.bold,
                max: 1),
            InkWell(
              onTap: () {},
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 20.h,
                    width: 80.w,
                    child: Icon(
                      Icons.image,
                      size: 6.h,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.h),
                        color: bl.withOpacity(0.2)),
                  )),
            ),
            Padding(
                padding: const EdgeInsets.all(10),
                child: textformfield_reause(hint: "Title", label: "title")),
            Padding(
                padding: const EdgeInsets.all(10),
                child:
                    textformfield_reause(hint: "Subtitle", label: "Subtitle")),
            Padding(
                padding: const EdgeInsets.all(10),
                child:
                    textformfield_reause(hint: "Language", label: "Languages")),
            Padding(
                padding: const EdgeInsets.all(10),
                child: textformfield_reause(
                    hint: "Price of the course", label: "Price")),
            Padding(
                padding: const EdgeInsets.all(10),
                child: textformfield_description(
                    hint: " add Descritpion", label: "Description", siz: 26.h)),
            SizedBox(
              height: 2.h,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.to(() => upload_videos_screen());
                  },
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 8.h,
                        width: 77.w,
                        child: Center(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 11.h,
                              ),
                              Icon(
                                Icons.upload,
                                color: wh,
                              ),
                              all_text(
                                  txt: "Upload Videos",
                                  col: wh,
                                  siz: 13.sp,
                                  wei: FontWeight.bold,
                                  max: 1),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: bl,
                          border: Border.all(width: 1, color: bl),
                          borderRadius: BorderRadius.circular(1.h),
                        ),
                      )),
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 8.h,
                        width: 13.w,
                        child: Center(
                            child: Icon(
                          Icons.video_library_sharp,
                          color: wh,
                        )),
                        decoration: BoxDecoration(
                          color: bl,
                          border: Border.all(width: 1, color: bl),
                          borderRadius: BorderRadius.circular(1.h),
                        ),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
          ],
        ),
      ),
    );
  }
}