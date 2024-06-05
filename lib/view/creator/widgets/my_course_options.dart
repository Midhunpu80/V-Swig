import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_int/main.dart';
import 'package:map_int/view/creator/screens/upload_video_screen/upload_videos_screen.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view/utilities/custom_text.dart';

import 'package:sizer/sizer.dart';

options({required BuildContext context, required var course_id}) {
  List allofoptions = ["Delete", "upload video", "edit course"];
  List<IconData> optionsicon = [
    Icons.delete,
    Icons.upload_outlined,
    Icons.edit
  ];
  return showBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: wh,
          height: 40.h,
          child: ListView.builder(
              itemCount: allofoptions.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    if (index == 1) {
                      image_controller.pickMedia();
                      Get.to(() => upload_videos_screen(
                          course_id: course_id,
                          url: image_controller.video_url.value.toString()));
                    }
                    print("time");
                  },
                  child: Padding(
                      padding: EdgeInsets.all(1.h),
                      child: Container(
                        height: 10.h,
                        width: 50.w,
                        color: gy.withOpacity(0.2),
                        child: ListTile(
                          leading: Icon(
                            optionsicon[index],
                            color: index == 2
                                ? gr
                                : index == 0
                                    ? re
                                    : bl,
                          ),
                          title: all_text(
                              txt: allofoptions[index].toString(),
                              col: bl,
                              siz: 12.sp,
                              wei: FontWeight.bold,
                              max: 1),
                        ),
                      )),
                );
              }),
        );
      });
}
