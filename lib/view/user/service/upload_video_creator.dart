// ignore_for_file: non_constant_identifier_names



import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:map_int/main.dart';
import 'package:uuid/uuid.dart';

class uploadvideo_service {
  upload_video(
      {required var course_id,
      required var videoFile,
      required var title,
      required var subtitle}) async {
    String res = "error";
    try {
      String video_id = Uuid().v1();
      String videoLink = await firestore_controll.uploadVideo(videoFile);

      FirebaseFirestore.instance
          .collection('Courses')
          .doc(course_id)
          .collection("Videos")
          .doc(video_id)
          .set({
        "creator_id ": FirebaseAuth.instance.currentUser?.uid.toString(),
        "video_id": video_id.toString(),
        "videoLink": videoLink.toString(),
        "Date": DateTime.now().toString(),
        "title": title.toString(),
        "subtitle": subtitle.toString(),
      });
      res = "sucess";
    } catch (e) {
      print(e.toString());
      res = "${e.toString()}";
    }
    return res;
  }
}
