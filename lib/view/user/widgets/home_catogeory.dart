import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view/utilities/custom_text.dart';
import 'package:sizer/sizer.dart';

home_catogery() {
  return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('catogery').snapshots(),
      builder: (context, snapshot) {
        final snap = snapshot.data?.docs;
        return !snapshot.hasData
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                decoration: const BoxDecoration(),
                height: 8.h,
                width: 100.w,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Container(
                            height: 5.h,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: gy.withOpacity(0.8),
                                    blurRadius: 5.5,
                                    offset: const Offset(10, 3),
                                    spreadRadius: 0.6)
                              ],
                              color: wh,
                              borderRadius: BorderRadius.circular(285.h),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(snap?[index]['image']),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: all_text(
                                        txt: snap?[index]['Name'].toString(),
                                        col: bl,
                                        siz: 12.sp,
                                        wei: FontWeight.bold,
                                        max: 1),
                                  ),
                                ),
                              ],
                            ),
                          ));
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox();
                    },
                    itemCount: snapshot.data!.docs.length),
              );
      });
}
