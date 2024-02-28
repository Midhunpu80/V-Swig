import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_int/main.dart';
import 'package:map_int/view/user/screens/homescreen/homescreen.dart';
import 'package:map_int/view/user/screens/profilescree/user_profilescreen.dart';
import 'package:map_int/view/utilities/colors.dart';

class bottomnavigationbarscreen extends StatelessWidget {
  List allpages = [
    homescreen(),
    homescreen(),
    homescreen(),
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
                icon: CircleAvatar(
                  radius: 15,
                  backgroundColor: bl,
                  backgroundImage: const AssetImage('images/home.png'),
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                  backgroundColor: wh,
                  icon: CircleAvatar(
                    radius: 15,
                    backgroundColor: bl,
                    backgroundImage: const AssetImage("images/loupe.png"),
                  ),
                  label: "Search"),
              BottomNavigationBarItem(
                  backgroundColor: wh,
                  icon: CircleAvatar(
                    radius: 15,
                    backgroundColor: bl,
                    backgroundImage: const AssetImage("images/subscribe.png"),
                  ),
                  label: "Subscrptions"),
              BottomNavigationBarItem(
                  backgroundColor: wh,
                  icon: CircleAvatar(
                    radius: 15,
                    backgroundColor: bl,
                    backgroundImage: const AssetImage("images/user.png"),
                  ),
                  label: "Profile")
            ]),
        body: allpages[page_controll.pageno.value],
      ),
    );
  }
}
