import 'package:flutter/material.dart';
import 'package:map_int/view/user/widgets/search_bar.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:sizer/sizer.dart';

class search_screen extends StatelessWidget {
  const search_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: wh,
        body: Column(
          children: [
            SizedBox(
              height: 3.h,
            ),
            searchbar(ico: Icons.search),
          ],
        ));
  }
}
