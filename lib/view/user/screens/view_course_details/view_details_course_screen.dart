import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_int/view/user/widgets/course_details.dart';
import 'package:map_int/view/utilities/colors.dart';

class view_course_details_screen extends StatelessWidget {
  List<QueryDocumentSnapshot<Map<String, dynamic>>>? snap;

  int index;

  view_course_details_screen({required this.snap,required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: wh,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: bl,
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.share,
                    color: bl,
                  )),
            ],
          ),
          course_details(snap: snap,index: index),
        ],
      ),
    );
  }
}
