import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_int/view/user/widgets/starrating.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view/utilities/custom_text.dart';
import 'package:sizer/sizer.dart';

class shopping_cart_screen extends StatelessWidget {
  const shopping_cart_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 7.h,
            width: 100.w,
            child: FloatingActionButton(
              backgroundColor: pp,
              onPressed: () {},
              child: all_text(
                  txt: "Checkout",
                  col: bl,
                  siz: 14.sp,
                  wei: FontWeight.bold,
                  max: 1),
            ),
          ),
        ),
        appBar: AppBar(
          toolbarHeight: 8.h,
          title: all_text(
              txt: "Shopping Cart",
              col: bl,
              siz: 14.sp,
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Total: ',
                        style: TextStyle(
                            color: wh.withOpacity(0.5),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                      text: '₹549',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.sp,
                      ),
                    ),
                    TextSpan(text: '82% off', style: TextStyle(color: pp)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  child: all_text(
                      txt: "1 Course in Cart",
                      col: wh,
                      siz: 13.sp,
                      wei: FontWeight.bold,
                      max: 1)),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(),
            ),

            /////////////////////courses///////////////////////////////////////////////////////
            SizedBox(
                height: 70.h,
                width: 100.w,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: Container(
                              height: 20.h,
                              width: 14.w,
                              decoration: BoxDecoration(
                                 
                                  color: re),
                            ),
                            title: all_text(
                                txt:
                                    "100days code of the complete pythonpro bootcamp",
                                col: wh,
                                siz: 12.sp,
                                wei: FontWeight.bold,
                                max: 2),
                            subtitle: all_text(
                                txt: "Dr.Angelyu",
                                col: wh,
                                siz: 10.sp,
                                wei: FontWeight.w400,
                                max: 2),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 12.h,
                              ),
                              all_text(
                                  txt: "4.7",
                                  col: yl,
                                  siz: 10.sp,
                                  wei: FontWeight.w400,
                                  max: 2),
                              SizedBox(
                                width: 1.h,
                              ),
                              starratingbar(itemsize: 2.h, initalraiting: 5),
                              SizedBox(
                                width: 1.h,
                              ),
                              all_text(
                                  txt: "(279,384)",
                                  col: gy,
                                  siz: 10.sp,
                                  wei: FontWeight.w400,
                                  max: 2),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 12.h),
                            child: SizedBox(
                                child: all_text(
                                    txt: "₹549",
                                    col: pp,
                                    siz: 13.sp,
                                    wei: FontWeight.bold,
                                    max: 2)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 12.h, top: 1.h),
                            child: Container(
                              height: 3.h,
                              width: 20.w,
                              color: gr.withOpacity(0.5),
                              child: Center(
                                  child: all_text(
                                      txt: "Updated",
                                      col: wh,
                                      siz: 9.sp,
                                      wei: FontWeight.w800,
                                      max: 1)),
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10.h,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Center(
                                    child: all_text(
                                        txt: "Remove",
                                        col: pp,
                                        siz: 9.sp,
                                        wei: FontWeight.w400,
                                        max: 1),
                                  )),
                              TextButton(
                                  onPressed: () {},
                                  child: Center(
                                    child: all_text(
                                        txt: "Save for Later",
                                        col: pp,
                                        siz: 9.sp,
                                        wei: FontWeight.w400,
                                        max: 1),
                                  )),
                              TextButton(
                                  onPressed: () {},
                                  child: Center(
                                    child: all_text(
                                        txt: "Move to WhishList",
                                        col: pp,
                                        siz: 9.sp,
                                        wei: FontWeight.w400,
                                        max: 1),
                                  ))
                            ],
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        thickness: 0,
                        color: gy,
                      );
                    },
                    itemCount: 10))
          ],
        ));
  }
}
