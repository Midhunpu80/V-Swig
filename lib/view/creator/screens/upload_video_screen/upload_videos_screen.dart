// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_int/view/creator/screens/uploaded_videos.dart/uploaded_videos_screen.dart';
import 'package:map_int/view/user/widgets/textform_filed.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view/utilities/custom_text.dart';
import 'package:sizer/sizer.dart';

class upload_videos_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wh,
      appBar: AppBar(
        toolbarHeight: 10.h,
        title: all_text(
            txt: "Upload Videos",
            col: bl,
            siz: 14.sp,
            wei: FontWeight.bold,
            max: 1),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: bl,
            )),
        backgroundColor: wh,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {},
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 20.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                        color: bl,
                        border: Border.all(width: 1, color: bl),
                        borderRadius: BorderRadius.circular(1.h),
                      ),
                    )),
              ),
              textformfield_reause(hint: "Video Title", label: "Video Title"),
              textformfield_reause(
                  hint: "Video SubTitile", label: "Video Subtitle"),
              SizedBox(
                height: 5.h,
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 6.h,
                      width: 80.w,
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
                      height: 6.h,
                      width: 80.w,
                      child: Center(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 15.h,
                            ),
                            Icon(
                              Icons.save,
                              color: wh,
                            ),
                            all_text(
                                txt: "Save",
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
                onTap: () {
                  Get.to(() => uploaded_video_screen());
                  
                },
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 6.h,
                      width: 80.w,
                      child: Center(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 11.h,
                            ),
                            Icon(
                              Icons.video_library_sharp,
                              color: wh,
                            ),
                            all_text(
                                txt: "Uploaded Videos",
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
            ],
          ),
        ),
      ),
    );
  }
}
