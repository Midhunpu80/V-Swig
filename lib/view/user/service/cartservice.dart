import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view/utilities/custom_snackbar.dart';

class cart_servie extends GetxController {
  RxInt sums = 0.obs;

  Future addcart(
      {required var title,
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
      ///sums.value = price;
      FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .collection("addcart")
          .doc(course_id)
          .set({
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
      }).then((value) => customsnackbar(
              titile: "sucess",
              messege: "sucessfully Added in the cart ",
              col: gr));
      totalsum(sum: price, course_id: course_id);
    } catch (e) {
      print(e.toString());
    }
  }

  Future remove_cart({required var courseid, required var remove_price}) async {
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .collection('addcart')
          .doc(courseid)
          .delete()
          .then((value) => customsnackbar(
              titile: "sucess", messege: "removed from the cart", col: re));
      remove(remove: remove_price, course_id: courseid);
    } catch (e) {
      print(e.toString());
    }
  }

  Future totalsum({required int sum, required var course_id}) async {
    List data = [];
    data.add(sum);
    print(data);
    for (int i in data) {
      sums.value += i;

      //sums.value += sum;

      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .collection("totlaprice")
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .set({"totalprice": sums.value});
      print("${sums.value.toString()}---------------------------<>");
    }
  }

  Future remove({required int remove, required var course_id}) async {
    sums.value -= remove;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("totlaprice")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .update({"totalprice": sums.value});
    if (sums.value == 0) {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .collection("totlaprice")
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .delete();
    }
    print(
        "-------------removed the data ------------------------------------------${sums.value.toString()}");
  }
}
