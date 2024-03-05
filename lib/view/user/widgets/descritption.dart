import 'package:flutter/material.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:sizer/sizer.dart';

textformfield_description({required String hint, required String label,required double siz}) {
  // ignore: sized_box_for_whitespace
  return Container(
    height:siz,
    width: 100.w,
    child: TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: bl),
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide(color: bl)),
          labelText: label,
          hintText: hint,
          labelStyle: TextStyle(
              fontSize: 12.sp, fontWeight: FontWeight.bold, color: bl),
          hintStyle: TextStyle(
              fontSize: 12.sp, fontWeight: FontWeight.w300, color: bl)),
    ),
  );
}
