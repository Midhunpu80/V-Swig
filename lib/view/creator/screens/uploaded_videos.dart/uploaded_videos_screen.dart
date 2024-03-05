import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view/utilities/custom_text.dart';
import 'package:sizer/sizer.dart';

class uploaded_video_screen extends StatelessWidget {
  const uploaded_video_screen({super.key});

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
        body: ListView.separated(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    child: ListTile(
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
                      txt: "part one machinlearing to the how ",
                      col: bl,
                      siz: 11.sp,
                      wei: FontWeight.bold,
                      max: 1),
                  subtitle: all_text(
                      txt: "part one machinlearing to the how ",
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
            itemCount: 15));
  }
}
