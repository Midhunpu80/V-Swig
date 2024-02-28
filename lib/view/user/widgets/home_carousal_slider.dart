import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: non_constant_identifier_names
home_carousal_slider() {
  return Container(
    height: 35.h,
    width: 100.w,
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
                "images/cute-beautiful-woman-with-wavy-hair-laughing-yellow-wall-indoor-photo-pretty-white-girl-wears-pink-blouse.jpg"),
            fit: BoxFit.cover)),
  );
}
// home_carousal_slider() {
//   return CarouselSlider(
//     options: CarouselOptions(height: 170.0),
//     items: [1, 2, 3, 4, 5].map((i) {
//       return Builder(
//         builder: (BuildContext context) {
//           return Container(
//             width: MediaQuery.of(context).size.width,
// //margin: const EdgeInsets.symmetric(horizontal: 5.0),
//             decoration: BoxDecoration(
//                 color: Colors.amber, borderRadius: BorderRadius.circular(2.h)),
//           );
//         },
//       );
//     }).toList(),
//   );
// }