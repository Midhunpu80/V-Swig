import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_int/view/user/screens/shopping_cart_screen/shopping_cart_screen.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view/utilities/custom_text.dart';
import 'package:sizer/sizer.dart';

class user_profile_screen extends StatelessWidget {
  List<String> alldata = [
    "Notification",
    "Downloads",
    "share V-swig",
    "Privacy-policy",
    "About V-swig"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: all_text(
            txt: "Account", col: bl, siz: 16.sp, wei: FontWeight.bold, max: 1),
        backgroundColor: wh,
        actions: [
          InkWell(
            onTap: () {
              Get.to(() => shopping_cart_screen());
            },
            child: Padding(
                padding: const EdgeInsets.all(2),
                child: Container(
                  height: 3.h,
                  width: 12.w,
                  decoration: BoxDecoration(
                    color: bl,
                    image: const DecorationImage(
                        image: AssetImage("images/bag.png")),
                    borderRadius: BorderRadius.circular(1.h),
                  ),
                )),
          ),
        ],
      ),
      backgroundColor: wh,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Icon(
              Icons.person_pin,
              color: gy,
              size: 15.h,
            ),
            all_text(
                txt: "Midhun pu",
                col: bl,
                siz: 17.sp,
                wei: FontWeight.w400,
                max: 1),
            Row(
              children: [
                SizedBox(
                  width: 10.h,
                ),
                Container(
                  height: 8.h,
                  width: 12.w,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            "images/wp2860498.jpg",
                          ),
                          fit: BoxFit.cover)),
                ),
                all_text(
                    txt: "midhunpu80@gmail.com",
                    col: bl,
                    siz: 12.sp,
                    wei: FontWeight.w400,
                    max: 1),
              ],
            ),
            TextButton(
                onPressed: () {},
                child: all_text(
                    txt: "Switch to Instructor",
                    col: pp,
                    siz: 14.sp,
                    wei: FontWeight.bold,
                    max: 1)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 35.h,
                width: 100.w,
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return ListTile(
                        // isThreeLine: false,
                        title: all_text(
                            txt:alldata[index].toString(),
                            col: bl,
                            siz: 12.sp,
                            wei: FontWeight.w600,
                            max: 1),
                        trailing: Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: bl,
                        ),
                      );
                    }),
              ),
            ),
            TextButton(
                onPressed: () {},
                child: all_text(
                    txt: "sign out",
                    col: pp,
                    siz: 14.sp,
                    wei: FontWeight.bold,
                    max: 1)),
            all_text(
                txt: "V-swig v1.0.0",
                col: gy,
                siz: 8.sp,
                wei: FontWeight.w400,
                max: 1),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
    );
  }
}
