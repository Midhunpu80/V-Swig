import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_int/view/user/screens/authentication/createaccount_with_email.dart';
import 'package:map_int/view/user/screens/authentication/signupscreen.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view/utilities/custom_text.dart';
import 'package:sizer/sizer.dart';

class signupscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: wh,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: bl,
            )),
      ),
      backgroundColor: wh,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 1.h),
            child: Container(
                child: all_text(
                    txt: "Create an account",
                    col: bl,
                    siz: 17.sp,
                    wei: FontWeight.bold,
                    max: 1)),
          ),
          Padding(
            padding: EdgeInsets.only(left: 3.h),
            child: Container(
                child: all_text(
                    txt:
                        "BY using our services you are agreeing to our \n         Terms and Privacy statements",
                    col: bl,
                    siz: 7.sp,
                    wei: FontWeight.w400,
                    max: 2)),
          ),
          SizedBox(
            height: 9.h,
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => create_account_with_email_screen());
            },
            child: option_for_Login(
                ico: Icon(
                  Icons.email,
                  color: bl,
                ),
                txt: "Sign up with Email"),
          ),
          GestureDetector(
              onTap: () {
                print("gamil");
              },
              child: option_for_Login(
                  ico: const CircleAvatar(
                    backgroundImage: AssetImage("images/googles.png"),
                  ),
                  txt: "Sign up with Google")),
          SizedBox(
            height: 13.h,
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
    );
  }
}

// ignore: non_constant_identifier_names
option_for_Login({required dynamic ico, required var txt}) {
  return Padding(
    padding: EdgeInsets.only(left: 2.h, top: 2.h),
    child: Container(
      height: 8.h,
      width: 90.w,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: bl),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(
            left: 8.h,
          ),
          child: ListTile(
            leading: ico,
            title: all_text(
                txt: txt, col: bl, siz: 12.sp, wei: FontWeight.bold, max: 1),
          ),
        ),
      ),
    ),
  );
}
