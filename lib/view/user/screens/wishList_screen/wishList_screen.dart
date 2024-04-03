import 'package:flutter/material.dart';
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
        toolbarHeight:10.h,
        centerTitle: true,
        backgroundColor: wh,
        leading: null,
        title: all_text(
            txt: "wishList", col: bl, siz: 14.sp, wei: FontWeight.bold, max: 1),
      ),
      body: listof_course_details_result(),
    );
  }
}
