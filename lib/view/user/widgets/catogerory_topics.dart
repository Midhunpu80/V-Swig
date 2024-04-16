import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_int/main.dart';
import 'package:map_int/view/user/screens/catogery_views_screen/catogery_viewscreen.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view/utilities/custom_text.dart';
import 'package:sizer/sizer.dart';

catogery_topics() {
  var generatedColor = Random().nextInt(Colors.primaries.length);
  Colors.primaries[generatedColor];
  return FutureBuilder(
      future: FirebaseFirestore.instance.collection('catogery').get(),
      builder: (context, snapshot) {
        final newsnap = snapshot.data?.docs;
        if (snapshot.data != null || snapshot.hasData) {
          for (var i in newsnap!) {
            if (snapshot.data == null) {
              print("error");
            } else {
              // search_controll.alldata.clear();
              // search_controll.showdata.clear();4

              search_controll.getdata(
                  cat_id: i['cat_id'],
                  name: i['Name'].toString(),
                  image: i['image']);
            }
          }
        }

        return !snapshot.hasData
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Obx(
                () => search_controll.showdata.value.isEmpty
                    ? all_text(
                        txt: "no data avalible ",
                        col: bl,
                        siz: 12.sp,
                        wei: FontWeight.bold,
                        max: 1)
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 70.h,
                          width: 100.w,
                          child: GridView.builder(
                              itemCount:
                                  search_controll.showdata.value.length > 6
                                      ? 7
                                      : search_controll.showdata.value.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 1.h,
                                      mainAxisSpacing: 1.h,
                                      childAspectRatio: 0.7),
                              itemBuilder: (context, index) {
                                final snap = search_controll.showdata[index];

                                return InkWell(
                                  onTap: () {
                                    print(
                                        "${snapshot.data?.docs[index]['cat_id']}  ${snapshot.data?.docs[index]['Name']}");
                                    Get.to(() => catogery_view_screen(
                                          snap: snapshot.data?.docs,
                                          catogery_id: snap['catogery_id'],
                                        ));
                                  },
                                  child: Container(
                                      height: 50.h,
                                      width: 80.w,
                                      decoration: BoxDecoration(
                                          //  image: DecorationImage(image: netwo),
                                          borderRadius:
                                              BorderRadius.circular(2.h),
                                          color: Colors.primaries[Random()
                                              .nextInt(
                                                  Colors.primaries.length)]),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: 23.h,
                                              width: 100.w,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          snap['img']),
                                                      fit: BoxFit.cover)),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          all_text(
                                              txt: snap['name'],
                                              col: wh,
                                              siz: 14.sp,
                                              wei: FontWeight.bold,
                                              max: 2),
                                        ],
                                      )),
                                );
                              }),
                        ),
                      ),
              );
      });
}
