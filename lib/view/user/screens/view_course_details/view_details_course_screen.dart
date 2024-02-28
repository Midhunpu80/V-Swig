import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_int/view/user/widgets/course_details.dart';
import 'package:map_int/view/utilities/colors.dart';

class view_course_details_screen extends StatelessWidget {
  const view_course_details_screen({super.key});

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
          course_details(),
        ],
      ),
    );
  }
}
