import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view/utilities/custom_text.dart';
import 'package:sizer/sizer.dart';

catogery_topics() {
  var generatedColor = Random().nextInt(Colors.primaries.length);
  Colors.primaries[generatedColor];
  return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('catogery').snapshots(),
      builder: (context, snapshot) {
        return !snapshot.hasData
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 70.h,
                  width: 100.w,
                  child: GridView.builder(
                      itemCount: snapshot.data?.docs.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 1.h,
                          mainAxisSpacing: 1.h,
                          childAspectRatio: 0.7),
                      itemBuilder: (context, index) {
                        final snap = snapshot.data?.docs[index];
                        return InkWell(
                          onTap: () {
                            print(
                                "${snapshot.data?.docs[index]['cat_id']}  ${snapshot.data?.docs[index]['Name']}");
                          },
                          child: Container(
                              height: 50.h,
                              width: 80.w,
                              decoration: BoxDecoration(
                                  //  image: DecorationImage(image: netwo),
                                  borderRadius: BorderRadius.circular(2.h),
                                  color: Colors.primaries[Random()
                                      .nextInt(Colors.primaries.length)]),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 23.h,
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image:
                                                  NetworkImage(snap?['image']),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  all_text(
                                      txt: snap?['Name'],
                                      col: wh,
                                      siz: 14.sp,
                                      wei: FontWeight.bold,
                                      max: 2),
                                ],
                              )),
                        );
                      }),
                ),
              );
      });
}
