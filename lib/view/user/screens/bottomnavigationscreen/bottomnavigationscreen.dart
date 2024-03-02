import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_int/main.dart';
import 'package:map_int/view/user/screens/homescreen/homescreen.dart';
import 'package:map_int/view/user/screens/profilescree/user_profilescreen.dart';
import 'package:map_int/view/user/screens/search_screen/search_screen.dart';
import 'package:map_int/view/utilities/colors.dart';

class bottomnavigationbarscreen extends StatelessWidget {
  List allpages = [
    const homescreen(),
    const search_screen(),
    const homescreen(),
    user_profile_screen(),
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
