import 'package:flutter/material.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view/utilities/custom_text.dart';
import 'package:sizer/sizer.dart';

class adminscreen extends StatelessWidget {
  const adminscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: all_text(
            txt: "admin", col: bl, siz: 12.sp, wei: FontWeight.bold, max: 1),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
