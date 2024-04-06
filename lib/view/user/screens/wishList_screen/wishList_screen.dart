import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:map_int/main.dart';
import 'package:map_int/view/user/widgets/Listof_courses_result.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view/utilities/custom_text.dart';
import 'package:sizer/sizer.dart';

class whishList_screen extends StatelessWidget {
  const whishList_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: wh,
        appBar: AppBar(
          toolbarHeight: 10.h,
          centerTitle: true,
          backgroundColor: wh,
          leading: null,
          title: all_text(
              txt: "wishList",
              col: bl,
              siz: 14.sp,
              wei: FontWeight.bold,
              max: 1),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("users")
                .doc(FirebaseAuth.instance.currentUser?.uid)
                .collection("wishlist")
                .snapshots(),
            builder: (context, snapshot) {
              final snap = snapshot.data?.docs;

              /// final snips = snapshots.data?.docs;

              return !snapshot.hasData
                  ? Center(
                      child: Icon(
                        Icons.bolt_sharp,
                        color: yl,
                        size: 5.h,
                      ),
                    )
                  : listof_course_details_result(snap: snap);
            }));
  }
}
