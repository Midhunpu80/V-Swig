import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_int/main.dart';
import 'package:map_int/view/user/service/cartservice.dart';
import 'package:map_int/view/user/widgets/starrating.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view/utilities/custom_text.dart';
import 'package:sizer/sizer.dart';

class shopping_cart_screen extends StatelessWidget {
  // double? rating;
  ///  List<dynamic> totalList = [];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .collection("addcart")
            .snapshots(),
        builder: (context, snapshot) {
          final totalsnap = snapshot.data?.docs;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return  const  Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          return !snapshot.hasData && snapshot.data != null
              ? const Center(child: CircularProgressIndicator())
              : Scaffold(
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerDocked,
                  floatingActionButton: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 7.h,
                      width: 100.w,
                      child: FloatingActionButton(
                        backgroundColor: pp,
                        onPressed: () {
                          /// total_controller.toalamount();
                        },
                        child: all_text(
                            txt: "Checkout",
                            col: bl,
                            siz: 14.sp,
                            wei: FontWeight.bold,
                            max: 1),
                      ),
                    ),
                  ),
                  appBar: AppBar(
                    toolbarHeight: 8.h,
                    title: all_text(
                        txt: "Shopping Cart",
                        col: bl,
                        siz: 14.sp,
                        wei: FontWeight.bold,
                        max: 1),
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
                  body: !snapshot.hasData && snapshot.data != null
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : snapshot.data!.docs.isEmpty
                          ? Center(
                              child: all_text(
                                  txt: "cart is  empty",
                                  col: wh,
                                  siz: 15.sp,
                                  wei: FontWeight.bold,
                                  max: 1),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                StreamBuilder(
                                    stream: FirebaseFirestore.instance
                                        .collection("users")
                                        .doc(FirebaseAuth
                                            .instance.currentUser?.uid)
                                        .collection("totlaprice")
                                        .snapshots(),
                                    builder: (context, snapshots) {
                                      final snaps = snapshots.data?.docs[0];

                                      return !snapshot.hasData
                                          ? const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          : snapshots.data!.docs.isEmpty
                                              ? const Center(
                                                  child: SizedBox(),
                                                )
                                              : Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text.rich(
                                                    TextSpan(
                                                      children: [
                                                        TextSpan(
                                                            text: 'Total: ',
                                                            style: TextStyle(
                                                                color: wh
                                                                    .withOpacity(
                                                                        0.5),
                                                                fontSize: 14.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                        TextSpan(
                                                          text:
                                                              '₹${snaps?['totalprice']}',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 30.sp,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                            text: '82% off',
                                                            style: TextStyle(
                                                                color: pp)),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                    }),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                      child: all_text(
                                          txt:
                                              "${snapshot.data?.docs.length.toString()} Course in Cart",
                                          col: wh,
                                          siz: 13.sp,
                                          wei: FontWeight.bold,
                                          max: 1)),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Divider(),
                                ),

                                /////////////////////courses///////////////////////////////////////////////////////
                                SizedBox(
                                    height: 70.h,
                                    width: 100.w,
                                    child: ListView.separated(
                                        itemBuilder: (context, index) {
                                          final snap =
                                              snapshot.data?.docs[index];

                                          // = snap?['rating'].toString();

                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ListTile(
                                                leading: Container(
                                                  height: 20.h,
                                                  width: 14.w,
                                                  decoration: BoxDecoration(
                                                      color: re,
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                            snap?['thumbanil'],
                                                          ),
                                                          fit: BoxFit.cover)),
                                                ),
                                                title: all_text(
                                                    txt: snap?['title'],
                                                    col: wh,
                                                    siz: 12.sp,
                                                    wei: FontWeight.bold,
                                                    max: 2),
                                                subtitle: all_text(
                                                    txt: snap?['creato_name'],
                                                    col: wh,
                                                    siz: 10.sp,
                                                    wei: FontWeight.w400,
                                                    max: 2),
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 12.h,
                                                  ),
                                                  all_text(
                                                      txt: snap?['rating'],
                                                      col: yl,
                                                      siz: 10.sp,
                                                      wei: FontWeight.w400,
                                                      max: 2),
                                                  SizedBox(
                                                    width: 1.h,
                                                  ),
                                                  starratingbar(
                                                      itemsize: 2.h,
                                                      initalraiting: 3),
                                                  SizedBox(
                                                    width: 1.h,
                                                  ),
                                                  all_text(
                                                      txt:
                                                          "(${snap?['reviews']})",
                                                      col: gy,
                                                      siz: 10.sp,
                                                      wei: FontWeight.w400,
                                                      max: 2),
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 12.h),
                                                child: SizedBox(
                                                    child: all_text(
                                                        txt:
                                                            "₹${snap?['price']}",
                                                        col: pp,
                                                        siz: 13.sp,
                                                        wei: FontWeight.bold,
                                                        max: 2)),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 12.h, top: 1.h),
                                                child: Container(
                                                  height: 3.h,
                                                  width: 20.w,
                                                  color: gr.withOpacity(0.5),
                                                  child: Center(
                                                      child: all_text(
                                                          txt: "Updated",
                                                          col: wh,
                                                          siz: 9.sp,
                                                          wei: FontWeight.w800,
                                                          max: 1)),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 10.h,
                                                  ),
                                                  TextButton(
                                                      onPressed: () {
                                                        car_controll.remove_cart(
                                                            remove_price:
                                                                snap?['price'],
                                                            courseid: snap![
                                                                'course_id']);
                                                      },
                                                      child: Center(
                                                        child: all_text(
                                                            txt: "Remove",
                                                            col: pp,
                                                            siz: 9.sp,
                                                            wei:
                                                                FontWeight.w400,
                                                            max: 1),
                                                      )),
                                                  TextButton(
                                                      onPressed: () {},
                                                      child: Center(
                                                        child: all_text(
                                                            txt:
                                                                "Save for Later",
                                                            col: pp,
                                                            siz: 9.sp,
                                                            wei:
                                                                FontWeight.w400,
                                                            max: 1),
                                                      )),
                                                  TextButton(
                                                      onPressed: () {},
                                                      child: Center(
                                                        child: all_text(
                                                            txt:
                                                                "Move to WhishList",
                                                            col: pp,
                                                            siz: 9.sp,
                                                            wei:
                                                                FontWeight.w400,
                                                            max: 1),
                                                      ))
                                                ],
                                              )
                                            ],
                                          );
                                        },
                                        separatorBuilder: (context, index) {
                                          return Divider(
                                            thickness: 0,
                                            color: gy,
                                          );
                                        },
                                        itemCount: snapshot.data!.docs.length))
                              ],
                            ));
        });
  }
}
