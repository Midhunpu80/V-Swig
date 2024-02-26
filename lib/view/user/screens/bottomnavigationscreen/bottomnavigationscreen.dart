import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_int/main.dart';
import 'package:map_int/view/user/screens/homescreen/homescreen.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view_model/pagecontroller/pagecontroller.dart';

class bottomnavigationbarscreen extends StatelessWidget {
  List allpages = [homescreen(), homescreen(), homescreen(), homescreen()];

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
                icon: CircleAvatar(
                  backgroundColor: wh,
                  backgroundImage: const AssetImage('images/home.png'),
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                  icon: CircleAvatar(
                    backgroundColor: wh,
                    backgroundImage: const AssetImage("images/learning.png"),
                  ),
                  label: "Catogery"),
              BottomNavigationBarItem(
                  icon: CircleAvatar(
                    backgroundColor: wh,
                    backgroundImage: const AssetImage("images/subscribe.png"),
                  ),
                  label: "Subscrptions"),
              BottomNavigationBarItem(
                  icon: CircleAvatar(
                    backgroundColor: wh,
                    backgroundImage: const AssetImage("images/user.png"),
                  ),
                  label: "Profile")
            ]),
        body: allpages[page_controll.pageno.value],
      ),
    );
  }
}
