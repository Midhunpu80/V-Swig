// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_int/main.dart';
import 'package:map_int/view/user/screens/catogery_views_screen/catogery_viewscreen.dart';
import 'package:map_int/view/user/widgets/search_bar.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view/utilities/custom_text.dart';
import 'package:sizer/sizer.dart';

class search_screen extends StatelessWidget {
  const search_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: wh,
        body: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection("Courses").snapshots(),
            builder: (context, snapshota) {
              final snap = snapshota.data?.docs;
              search_product_controll.alldata.clear();

              for (var i in snap!) {
                search_product_controll.getdata(
                    cat_name: i['catogery_name'],
                    product_name: i['title'],
                    product_id: i['course_id'],
                    product_image: i['thumbanil'],
                    rating: i['rating'],
                    price: i['price'],
                    reviews: i['reviews'],
                    subtitle: i['subtitle']);
              }

              return !snapshota.hasData
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 3.h,
                          ),
                          searchbar(ico: Icons.search),
                          Padding(
                            padding: EdgeInsets.only(left: 2.h),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  child: all_text(
                                      txt: "Catogeries",
                                      col: bl,
                                      siz: 12.sp,
                                      wei: FontWeight.bold,
                                      max: 1)),
                            ),
                          ),
                          StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection("catogery")
                                  .snapshots(),
                              builder: (context, snapshot) {
                                return !snapshot.hasData
                                    ? const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          color: gy.withOpacity(0.3),
                                          height: 75.h,
                                          width: 100.w,
                                          child: ListView.separated(
                                              itemBuilder: (context, index) {
                                                final snap =
                                                    snapshot.data?.docs[index];

                                                return InkWell(
                                                  onTap: () {
                                                    print(
                                                        "${snapshot.data?.docs[index]['cat_id']}  ${snapshot.data?.docs[index]['Name']}");
                                                    Get.to(() =>
                                                        catogery_view_screen(
                                                          snap: snapshot
                                                              .data?.docs,
                                                          catogery_id:
                                                              snap?['cat_id'],
                                                        ));
                                                  },
                                                  child: ListTile(
                                                      leading: const Icon(
                                                          Icons.square),
                                                      title: all_text(
                                                          txt: snap?["Name"],
                                                          col: bl,
                                                          siz: 12.sp,
                                                          wei: FontWeight.bold,
                                                          max: 1)),
                                                );
                                              },
                                              separatorBuilder:
                                                  (context, index) {
                                                return const SizedBox();
                                              },
                                              itemCount:
                                                  snapshot.data!.docs.length),
                                        ),
                                      );
                              })
                        ],
                      ),
                    );
            }));
  }
}
