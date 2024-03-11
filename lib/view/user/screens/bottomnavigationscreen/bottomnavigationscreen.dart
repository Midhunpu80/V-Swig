import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_int/main.dart';
import 'package:map_int/view/creator/screens/created_courses/created_course_screen.dart';

import 'package:map_int/view/user/screens/homescreen/homescreen.dart';
import 'package:map_int/view/user/screens/profilescree/user_profilescreen.dart';
import 'package:map_int/view/user/screens/search_screen/search_screen.dart';
import 'package:map_int/view/user/screens/view_course_details/view_details_course_screen.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view_model/userdata_controller/userDate_controller%20.dart';

class bottomnavigationbarscreen extends StatelessWidget {
  final userdatasz = Get.put(user_data_controller());

  /// dynamic daaata = type==true?

  List allpages = [
    homescreen(),
    // ignore: prefer_const_constructors
    search_screen(),
    homescreen(),
    // ignore: unrelated_type_equality_checks
    Obx(() => userdatasz_controll.types.value == true
        ? homescreen()
        :created_course_screen()),
    user_profile_screen()
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: page_controll.pageno.value,
            onTap: (val) {
              page_controll.change(val);
              if (val == 3) {
                if (userdatasz.types.value == true) {
                  homescreen();
                } else {
                  view_course_details_screen();
                }
              }
            },
            selectedItemColor: bl,
            unselectedItemColor: gy,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(
                backgroundColor: wh,
                icon: Icon(
                  Icons.home_filled,
                  color: bl,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                  backgroundColor: wh,
                  icon: Icon(
                    Icons.search,
                    color: bl,
                  ),
                  label: "Search"),
              BottomNavigationBarItem(
                  backgroundColor: wh,
                  icon: Icon(
                    Icons.favorite,
                    color: bl,
                  ),
                  label: "whishList"),
              BottomNavigationBarItem(
                  backgroundColor: wh,
                  icon: Icon(
                    Icons.subscriptions_rounded,
                    color: bl,
                  ),
                  label: "Subscrptions"),
              BottomNavigationBarItem(
                  backgroundColor: wh,
                  icon: Icon(
                    Icons.person_2_rounded,
                    color: bl,
                  ),
                  label: "Profile")
            ]),
        body: allpages[page_controll.pageno.value],
      ),
    );
  }
}
