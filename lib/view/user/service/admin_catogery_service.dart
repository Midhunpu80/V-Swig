import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:map_int/main.dart';
import 'package:uuid/uuid.dart';

class admin_catogery_service extends GetxController {
  Future create_catogery({required var name, required Uint8List file}) async {
    String res = "error";
    var files = file;

    try {
      String catogery_id = Uuid().v1();
      final String imageLink = await firestore_controll.uploadimagefirebase("catogeryicons", files, true);
      print(imageLink.toString());

      var data = {
        "cat_id": catogery_id.toString(),
        "Name": name,
        "image": imageLink.toString()
      };

      await FirebaseFirestore.instance
          .collection("catogery")
          .doc(catogery_id)
          .set(data)
          .then((value) => Get.back());
      print("sucess");
      print(imageLink.toString());

      res = "sucess";
    
    } catch (e) {
      res = "failed${e.toString()}";
      print(e.toString());
      print("failed");
    }
    return res;
  }
}
