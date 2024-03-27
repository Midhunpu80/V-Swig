import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_int/main.dart';
import 'package:map_int/view/user/screens/shopping_cart_screen/shopping_cart_screen.dart';
import 'package:map_int/view/user/widgets/edit_instructor.dart';
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
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          final snap = snapshot.data?.docs;
          final newdata = snap?.first.data();

          return !snapshot.hasData
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Scaffold(
                  appBar: AppBar(
                    title: all_text(
                        txt: "Account",
                        col: bl,
                        siz: 16.sp,
                        wei: FontWeight.bold,
                        max: 1),
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
                        Obx(() => userdatasz_controll.types.value == true
                            ? Icon(
                                Icons.person_pin,
                                color: gy,
                                size: 15.h,
                              )
                            : IconButton(
                                onPressed: () {
                                  edit_insturctor(
                                      image: newdata!['profile'],
                                      context: context,
                                      name: newdata['Name'],
                                      bio: newdata['bio']);
                                },
                                icon: Icon(
                                  Icons.edit_square,
                                  color: gy,
                                  size: 12.h,
                                ))),
                        all_text(
                            txt: newdata!['Name'],
                            col: bl,
                            siz: 17.sp,
                            wei: FontWeight.w400,
                            max: 1),
                        Row(
                          children: [
                            SizedBox(
                              width: 8.h,
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
                                txt: newdata['email'],
                                col: bl,
                                siz: 12.sp,
                                wei: FontWeight.w400,
                                max: 1),
                          ],
                        ),
                        TextButton(
                            onPressed: () {
                              auth_controll.switchType(
                                  type: userdatasz_controll.types.value);
                              userdatasz_controll.fetchData();
                            },
                            child: Obx(() => all_text(
                                txt: userdatasz_controll.types.value == true
                                    ? "Switch to Instructor"
                                    : "Switch to Student",
                                col: pp,
                                siz: 14.sp,
                                wei: FontWeight.bold,
                                max: 1))),
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
                                        txt: alldata[index].toString(),
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
                            onPressed: () {
                              auth_controll.logout();
                            },
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
        });
  }
}
