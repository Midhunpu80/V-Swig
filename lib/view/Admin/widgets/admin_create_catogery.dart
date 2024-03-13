// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_int/main.dart';
import 'package:map_int/view/user/widgets/textform_filed.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view/utilities/custom_text.dart';
import 'package:map_int/view_model/imagepicker_controller/image_picker_controller.dart';
import 'package:sizer/sizer.dart';

admin_create_catogery({required BuildContext context}) {
  final title_controller = TextEditingController();
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: wh,
        content: Container(
          color: wh,
          height: 50.h,
          width: 100.w,
          // ignore: prefer_const_constructors
          child: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    image_controller.pickimages();
                  },
                  child: Obx(
                    () => image_controller.img.value == null
                        ? CircleAvatar(
                            backgroundColor: gy.withOpacity(0.2),
                            radius: 7.h,
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.photo,
                                  color: bl,
                                  size: 5.h,
                                )),
                          )
                        : CircleAvatar(
                            backgroundColor: gy.withOpacity(0.2),
                            radius: 7.h,
                            backgroundImage:
                                MemoryImage(image_controller.img.value!),
                          ),
                  ),
                ),
                textformfield_reause(
                    hint: "Enter title ",
                    label: "Title",
                    controller: title_controller),
                SizedBox(
                  height: 5.h,
                ),
                InkWell(
                  onTap: () {
                    if (title_controller.text.isNotEmpty) {
                      admin_controll.create_catogery(
                          name: title_controller.text,
                          file: image_controller.img.value!);
                      print("sucess");

                    } else {
                      print("failed for");
                    }
                  },
                  child: Container(
                    height: 8.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1.h), color: bl),
                    child: Center(
                      child: all_text(
                          txt: "Create",
                          col: wh,
                          siz: 12.sp,
                          wei: FontWeight.bold,
                          max: 1),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
