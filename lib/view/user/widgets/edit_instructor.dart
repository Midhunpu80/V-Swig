import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_int/main.dart';
import 'package:map_int/view/user/widgets/descritption.dart';
import 'package:map_int/view/user/widgets/textform_filed.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view/utilities/custom_text.dart';
import 'package:map_int/view_model/imagepicker_controller/image_picker_controller.dart';
import 'package:sizer/sizer.dart';

edit_insturctor(
    {required BuildContext context,
    required var name,
    required var bio,
    required var image}) {
  final bio_controller = TextEditingController(text: bio.toString());
  final name_controller = TextEditingController(text: name.toString());
  return showBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 60.h,
          width: 100.w,
          color: wh,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Stack(
                    children: [
                      Obx(() => image_controller.img.value != null
                          ? CircleAvatar(
                              backgroundColor: bl,
                              radius: 8.h,
                              backgroundImage:
                                  MemoryImage(image_controller.img.value!),
                            )
                          : CircleAvatar(
                              backgroundColor: bl,
                              radius: 8.h,
                              backgroundImage: NetworkImage(image),
                            )),
                      Positioned(
                          top: 10.h,
                          right: 1,
                          child: CircleAvatar(
                            radius: 2.h,
                            child: IconButton(
                              onPressed: () {
                                image_controller.pickimages();
                              },
                              icon: Center(
                                  child: Icon(
                                Icons.add,
                                size: 2.h,
                              )),
                            ),
                          ))
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      auth_controll.edit_instructor(
                          name: name_controller.text,
                          bio: bio_controller.text,
                          profile: image_controller.img.value!);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 5.h,
                        width: 30.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1.h),
                            color: wh,
                            border: Border.all(width: 1, color: bl)),
                        child: Center(
                          child: all_text(
                              txt: "Save Changes",
                              col: bl,
                              siz: 11.sp,
                              wei: FontWeight.bold,
                              max: 1),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        child: textformfield_reause(
                      controller: name_controller,
                      hint: "Name",
                      label: "Name",
                    )),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  textformfield_description(
                      hint: "bio",
                      label: "bio",
                      siz: 20.h,
                      controller: bio_controller),
                ],
              ),
            ),
          ),
        );
      });
}
