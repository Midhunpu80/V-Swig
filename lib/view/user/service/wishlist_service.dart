import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class wishlist_service extends GetxController {
  final CollectionReference _wishListdata = FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection("wishlist");

  addfav(
      {
      required List<DocumentSnapshot> fav,
      required var title,
      required var rating,
      required var subtitle,
      required var reviews,
      required var language,
      required int price,
      required var course_id,
      required var students,
      required var thumbnail,
      required var description,
      required var catogery,
      required var catogery_id,
      required var creator,
      required var creator_emailaddress,
      required var creator_id}) async {
    try {
      if (!fav.contains(course_id)) {
        await _wishListdata.doc(course_id).set({
          "rating": rating,
          "reviews": reviews,
          "students": students,
          "catogery_name": catogery,
          "catogery_id": catogery_id,
          "course_id": course_id,
          "creator_uid": creator_id,
          "title": title,
          "subtitle": subtitle,
          "thumbanil": thumbnail,
          "creato_name": creator,
          "creator_email": creator_emailaddress,
          "description": description,
          "price": price,
          "language": language,
          "totalprice": price
        });
      } else {
        _wishListdata.doc(course_id).delete();
      }
    } catch (e) {
      print(e.toString());
    }
  }

  /// List<DocumentSnapshot> favorites = snapshot.data.documents;
}
