import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_int/view/user/widgets/Listof_courses_result.dart';
import 'package:map_int/view/user/widgets/search_bar.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:sizer/sizer.dart';

class search_result_screen extends StatelessWidget {
  const search_result_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wh,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 3.h,
            ),
            searchbar(ico: Icons.arrow_back,fun: back ),
            listof_course_details_result()
          ],
        ),
      ),
    );
  }
}

back() {
  Get.back();
}
