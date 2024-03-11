import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_int/main.dart';
import 'package:map_int/view/user/screens/authentication/createaccount_with_email.dart';
import 'package:map_int/view/user/widgets/textform_filed.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view/utilities/custom_text.dart';
import 'package:sizer/sizer.dart';

class Loginscreen extends StatelessWidget {
  final email_edit_controller = TextEditingController();
  final passwor_edit_controller = TextEditingController();

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
                      txt: "Login",
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
            // Row(
            //   children: [
            //     Obx(
            //       () => Expanded(
            //         child: ListTile(
            //           title: all_text(
            //               txt: "Creator",
            //               col: bl,
            //               siz: 12.sp,
            //               wei: FontWeight.w600,
            //               max: 2),
            //           leading: Radio<int>(
            //             value: 1,
            //             groupValue: mode_controll.mode.value,
            //             activeColor: Colors
            //                 .red, // Change the active radio button color here
            //             fillColor: MaterialStateProperty.all(
            //                 Colors.red), // Change the fill color when selected
            //             splashRadius:
            //                 20, // Change the splash radius when clicked
            //             onChanged: (int? value) {
            //               mode_controll.changemode(index: value);
            //             },
            //           ),
            //         ),
            //       ),
            //     ),
            //     Obx(
            //       () => Expanded(
            //         child: ListTile(
            //           title: all_text(
            //               txt: "Student",
            //               col: bl,
            //               siz: 12.sp,
            //               wei: FontWeight.w600,
            //               max: 2),
            //           leading: Radio<int>(
            //             value: 2,
            //             groupValue: mode_controll.mode.value,
            //             activeColor: Colors
            //                 .red, // Change the active radio button color here
            //             fillColor: MaterialStateProperty.all(
            //                 Colors.red), // Change the fill color when selected
            //             splashRadius:
            //                 20, // Change the splash radius when clicked
            //             onChanged: (int? value) {
            //               mode_controll.changemode(index: value);
            //             },
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            Padding(
                padding: EdgeInsets.only(left: 4.h, right: 2.h, top: 1.h),
                child: textformfield_reause(
                    hint: "Enter your Email address",
                    label: "Email",
                    controller: email_edit_controller)),
            Padding(
                padding: EdgeInsets.only(left: 4.h, right: 2.h, top: 1.h),
                child: textformfield_reause(
                    hint: " Enter Your Password",
                    label: "Password",
                    controller: passwor_edit_controller)),
            SizedBox(
              height: 3.h,
            ),
            InkWell(
              onTap: () {
                if (email_edit_controller.text.isNotEmpty ||
                    passwor_edit_controller.text.isNotEmpty) {
                  auth_controll.Login_user(
                      email: email_edit_controller.text,
                      password: passwor_edit_controller.text);
                } else {
                  print("is empty ");
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
                        txt: "Login",
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
                    txt: "New Here ?",
                    col: bl,
                    siz: 12.sp,
                    wei: FontWeight.bold,
                    max: 1),
                TextButton(
                    onPressed: () {
                      Get.to(() => create_account_with_email_screen());
                    },
                    child: all_text(
                        txt: "Create Account ",
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
