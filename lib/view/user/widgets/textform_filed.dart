import 'package:flutter/material.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:sizer/sizer.dart';

textformfield_reause({required String hint, required String label}) {
  // ignore: sized_box_for_whitespace
  return Container(
    height: 8.h,
    width: 100.w,
    child: TextFormField(
      style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: bl),
      decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          labelStyle: TextStyle(
              fontSize: 12.sp, fontWeight: FontWeight.bold, color: bl),
          hintStyle: TextStyle(
              fontSize: 12.sp, fontWeight: FontWeight.w300, color: bl)),
    ),
  );
}
