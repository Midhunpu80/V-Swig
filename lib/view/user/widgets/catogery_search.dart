import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:map_int/main.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view_model/search_catogery_controller/search_controller.dart';
import 'package:sizer/sizer.dart';

catogoery_search() {
  final cat_search_controll = TextEditingController();
  return Padding(
    padding: EdgeInsets.only(
      left: 1.h,
    ),
    child: Container(
      height: 7.h,
      width: 80.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1.h),
          border: Border.all(width: 1, color: gy)),
      child: Center(
        child: Row(
          children: [
            SizedBox(
              width: 2.h,
            ),
            CircleAvatar(
              backgroundColor: wh,
              child: Icon(
                Icons.search,
                color: bl,
              ),
            ),
            SizedBox(
              width: 2.h,
            ),
            Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: SizedBox(
                  height: 4.h,
                  width: 60.w,
                  child: TextFormField(
                    style: TextStyle(color: bl),
                    controller: cat_search_controll,
                    onChanged: (val) {
                      search_controll.searchquery(cat_search_controll.value.text.toString());
                      print(cat_search_controll.value.text.toString());
                    },
                    decoration: InputDecoration(
                        hintStyle: TextStyle(fontSize: 12.sp, color: gy),
                        hintText: "What are you Looking for",
                        border: InputBorder.none),
                  )),
            )
          ],
        ),
      ),
    ),
  );
}
