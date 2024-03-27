import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:map_int/main.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:uuid/uuid.dart';

class create_course_servie extends GetxController {
  Future newcreate_courses(
      {required var title,
      required var subtitle,
      required var language,
      required var price,
      required Uint8List thumbnail,
      required var description,
      required var catogery,
      required var catogery_id,
      required var creator,
      required var creator_emailaddress,
      required var catogery_name}) async {
    try {
      String course_id = Uuid().v1();

      String thumbnailLink = await firestore_controll.uploadimagefirebase(
          "Thumbanils", thumbnail, true);
      await FirebaseFirestore.instance
          .collection('Courses')
          .doc(course_id)
          .set({
        "rating": "0",
        "reviews": "0",
        "students": "0",
        "catogery_name": catogery_name,
        "catogery_id": catogery_id,
        "course_id": course_id,
        "creator_uid": FirebaseAuth.instance.currentUser?.uid,
        "title": title,
        "subtitle": subtitle,
        "thumbanil": thumbnailLink.toString(),
        "creato_name": creator,
        "creator_email": creator_emailaddress,
        "description": description,
        "price": price,
        "language": language,
      }).then((value) => Get.snackbar("created course", "sucessfully_screated",
              backgroundColor: gr));
    } catch (e) {
      print(e.toString());
    }
  }
}
