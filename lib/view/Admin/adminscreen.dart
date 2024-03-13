import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:map_int/main.dart';
import 'package:map_int/view/Admin/widgets/admin_create_catogery.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view/utilities/custom_text.dart';
import 'package:sizer/sizer.dart';

class adminscreen extends StatelessWidget {
  const adminscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: wh,
        onPressed: () {
          admin_create_catogery(context: context);
        },
        child: all_text(
            txt: "create", col: bl, siz: 12.sp, wei: FontWeight.bold, max: 1),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                auth_controll.logout();
              },
              icon: Icon(
                Icons.logout,
                color: bl,
              ))
        ],
        toolbarHeight: 10.h,
        centerTitle: true,
        backgroundColor: wh,
        title: all_text(
            txt: "Admin Dashboard",
            col: bl,
            siz: 15.sp,
            wei: FontWeight.bold,
            max: 1),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('catogery').snapshots(),
            builder: (context, snapshot) {
              return !snapshot.hasData
                  ? Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Column(
                      children: [
                        Container(
                          height: 87.h,
                          width: 100.w,

                          ///  color: re,
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                final snap = snapshot.data?.docs[index];
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(snap?['image']),
                                    ),
                                    title: all_text(
                                        txt: snap?['Name'],
                                        col: wh,
                                        siz: 13.sp,
                                        wei: FontWeight.w600,
                                        max: 1),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox();
                              },
                              itemCount: snapshot.data!.docs.length),
                        )
                      ],
                    );
            }),
      ),
    );
  }
}
