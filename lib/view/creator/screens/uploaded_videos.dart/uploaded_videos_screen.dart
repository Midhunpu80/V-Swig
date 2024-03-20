// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_int/main.dart';
import 'package:map_int/view/creator/screens/play_video_screen/play_videoscreen.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view/utilities/custom_text.dart';
import 'package:sizer/sizer.dart';

class uploaded_video_screen extends StatelessWidget {
  var course_id;
  uploaded_video_screen({required this.course_id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: wh,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert_outlined,
                  color: bl,
                ))
          ],
          toolbarHeight: 10.h,
          centerTitle: true,
          title: all_text(
              txt: "All Videos",
              col: bl,
              siz: 13.sp,
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
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Courses')
                .doc(course_id)
                .collection('Videos')
                .snapshots(),
            builder: (context, snapshot) {
              final snap = snapshot.data?.docs;
              return !snapshot.hasData
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              child: ListTile(
                            onTap: ()async {
                            await  videoplayer_controll.geturl(
                                  url: snap?[index]['videoLink']);
                              print(
                                  "${snap?[index]['videoLink'].toString()}------->");
                              Get.to(() => play_videoscreen(
                                    videoLink: snap?[index]['videoLink'],
                                  ));
                            },
                            trailing: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.more_vert,
                                  color: bl,
                                )),
                            leading: Icon(
                              Icons.video_collection_outlined,
                              color: bl,
                            ),
                            title: all_text(
                                txt: snap?[index]['title'],
                                col: bl,
                                siz: 11.sp,
                                wei: FontWeight.bold,
                                max: 1),
                            subtitle: all_text(
                                txt: snap?[index]['subtitle'],
                                col: bl,
                                siz: 8.sp,
                                wei: FontWeight.bold,
                                max: 1),
                          )),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox();
                      },
                      itemCount: snapshot.data!.docs.length);
            }));
  }
}
