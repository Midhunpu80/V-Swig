// ignore_for_file: sort_child_properties_last, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_int/main.dart';
import 'package:map_int/view/creator/screens/uploaded_videos.dart/uploaded_videos_screen.dart';
import 'package:map_int/view/user/widgets/textform_filed.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view/utilities/custom_text.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

class upload_videos_screen extends StatelessWidget {
  String? course_id;
  String? url;

  upload_videos_screen({required this.course_id, required this.url});

  final title_conttroller = TextEditingController();
  final subtitle_controller = TextEditingController();
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
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  image_controller.pickMedia();
                },
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(() => image_controller.video_url.value.isEmpty
                        ? Container(
                            height: 20.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                              color: bl,
                              border: Border.all(width: 1, color: bl),
                              borderRadius: BorderRadius.circular(1.h),
                            ),
                          )
                        : AspectRatio(
                            aspectRatio: 0.9,
                            child: VideoPlayer(
                                image_controller.videoPlayerController)))),
              ),
              CircleAvatar(
                backgroundColor: bl,
                child: IconButton(
                    onPressed: () {
                      image_controller.playtoggele();
                    },
                    icon: Obx(() => image_controller.isPlaying.value
                        ? const Icon(Icons.pause)
                        : const Icon(Icons.play_arrow))),
              ),
              textformfield_reause(
                  hint: "Video Title",
                  label: "Video Title",
                  controller: title_conttroller),
              textformfield_reause(
                  hint: "Video SubTitile",
                  label: "Video Subtitle",
                  controller: subtitle_controller),
              SizedBox(
                height: 5.h,
              ),
              // Obx(
              //   () => video_upload_controll.isLoading.value
              //       ? Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: LinearProgressIndicator(
              //             value: video_upload_controll.progress / 100,
              //           ),
              //         )
              //       : Container(
              //           width: 80.w,
              //           child: Row(
              //             children: [
              //               Expanded(
              //                 child: LinearProgressIndicator(
              //                   color: yl,
              //                   backgroundColor: wh,
              //                   value: video_upload_controll.progress / 100,
              //                 ),
              //               ),
              //           all_text(
              //                   txt: "100",
              //                   col: bl,
              //                   siz: 12.sp,
              //                   wei: FontWeight.bold,
              //                   max: 1),
              //             ],
              //           ),
              //         ),
              // ),
              Obx(
                () => video_upload_controll.isLoading.value
                    ? Column(
                        children: [
                          Container(
                            height: 10.h, width: 20.w,
                            //aspectRatio: 5,
                            child: CircularProgressIndicator(
                              strokeWidth: 3.h,
                              backgroundColor: gy,
                              color: gr,
                              value: video_upload_controll.progress / 100,
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          all_text(
                              txt:
                                  "${video_upload_controll.progress.value.toStringAsFixed(2)}",
                              col: bl,
                              siz: 12.sp,
                              wei: FontWeight.bold,
                              max: 1),
                          SizedBox(
                            height: 3.h,
                          ),
                        ],
                      )
                    : Container(
                        child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              image_controller.pickMedia();
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
                                          width: 15.h,
                                        ),
                                        Icon(
                                          Icons.add,
                                          color: wh,
                                        ),
                                        all_text(
                                            txt: "Pick video",
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
                            onTap: () {
                              print(
                                  image_controller.video_url.value.toString());
                              video_upload_controll.uploadvideos_courses(
                                  course_id: course_id,
                                  videoFile: image_controller.video_url.value,
                                  title: title_conttroller.text.toString(),
                                  subtitle:
                                      subtitle_controller.text.toString());
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
                              // videoplayer_controll.urlLink.value = url.toString();
                              Get.to(() => uploaded_video_screen(
                                    course_id: course_id,
                                  ))?.then((value) {
                                videoplayer_controll.geturl(url: url);
                              });
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
                      )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
