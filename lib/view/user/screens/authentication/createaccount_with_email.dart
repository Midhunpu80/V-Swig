// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_int/main.dart';
import 'package:map_int/view/user/screens/authentication/Loginscreen.dart';
import 'package:map_int/view/user/widgets/textform_filed.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view/utilities/custom_text.dart';
import 'package:sizer/sizer.dart';

class create_account_with_email_screen extends StatelessWidget {
  final email_edit_controller = TextEditingController();
  final password_edit_controller = TextEditingController();
  final name_edit_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      backgroundColor: wh,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 2.h),
              child: Container(
                  child: all_text(
                      txt: "Create an account",
                      col: bl,
                      siz: 23.sp,
                      wei: FontWeight.bold,
                      max: 1)),
            ),
            SizedBox(
              height: 1.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 3.h),
              child: Container(
                  child: all_text(
                      txt:
                          "BY using our services you are agreeing to our \n         Terms and Privacy statements",
                      col: bl,
                      siz: 12.sp,
                      wei: FontWeight.w300,
                      max: 2)),
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              children: [
                Obx(
                  () => Expanded(
                    child: ListTile(
                      title: all_text(
                          txt: "Creator",
                          col: bl,
                          siz: 12.sp,
                          wei: FontWeight.w600,
                          max: 2),
                      leading: Radio<int>(
                        value: 1,
                        groupValue: mode_controll.mode.value,
                        activeColor: Colors
                            .red, // Change the active radio button color here
                        fillColor: MaterialStateProperty.all(
                            Colors.red), // Change the fill color when selected
                        splashRadius:
                            20, // Change the splash radius when clicked
                        onChanged: (int? value) {
                          mode_controll.changemode(index: value);
                        },
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => Expanded(
                    child: ListTile(
                      title: all_text(
                          txt: "Student",
                          col: bl,
                          siz: 12.sp,
                          wei: FontWeight.w600,
                          max: 2),
                      leading: Radio<int>(
                        value: 2,
                        groupValue: mode_controll.mode.value,
                        activeColor: Colors
                            .red, // Change the active radio button color here
                        fillColor: MaterialStateProperty.all(
                            Colors.red), // Change the fill color when selected
                        splashRadius:
                            20, // Change the splash radius when clicked
                        onChanged: (int? value) {
                          mode_controll.changemode(index: value);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
                padding: EdgeInsets.only(left: 4.h, right: 2.h, top: 1.h),
                child: textformfield_reause(
                    hint: "Name",
                    label: "Name",
                    controller: name_edit_controller)),
            Padding(
                padding: EdgeInsets.only(left: 4.h, right: 2.h, top: 1.h),
                child: textformfield_reause(
                    hint: "Email",
                    label: "Email",
                    controller: email_edit_controller)),
            Padding(
                padding: EdgeInsets.only(left: 4.h, right: 2.h, top: 1.h),
                child: textformfield_reause(
                    hint: "Password",
                    label: "Password",
                    controller: password_edit_controller)),
            SizedBox(
              height: 3.h,
            ),
            InkWell(
              onTap: () {
                if (email_edit_controller.text.isNotEmpty ||
                    name_edit_controller.text.isNotEmpty ||
                    password_edit_controller.text.isNotEmpty) {
                  auth_controll.signup_user(
                      email: email_edit_controller.text.toString(),
                      password: password_edit_controller.text.toString(),
                      name: name_edit_controller.text.toString()).then((value) => Get.to(()=>Loginscreen()));
                  print(email_edit_controller.text.toString());
                } else {
                  print("prifnn");
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 8.h,
                  width: 90.w,
                  color: bl,
                  child: Center(
                    child: all_text(
                        txt: "Create account",
                        col: wh,
                        siz: 13.sp,
                        wei: FontWeight.bold,
                        max: 1),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 11.h,
                ),
                all_text(
                    txt: "Havent an account?",
                    col: bl,
                    siz: 12.sp,
                    wei: FontWeight.bold,
                    max: 1),
                TextButton(
                    onPressed: () {},
                    child: all_text(
                        txt: "Sign In",
                        col: pp,
                        siz: 12.sp,
                        wei: FontWeight.bold,
                        max: 1))
              ],
            )
          ],
        ),
      ),
    );
  }
}
