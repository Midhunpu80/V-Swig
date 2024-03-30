// ignore_for_file: non_constant_identifier_names, camel_case_types, unused_local_variable

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:map_int/main.dart';
import 'package:map_int/view/Admin/adminscreen.dart';
import 'package:map_int/view/user/screens/authentication/browse_or_signin.dart';
import 'package:map_int/view/user/screens/bottomnavigationscreen/bottomnavigationscreen.dart';
import 'package:map_int/view/utilities/colors.dart';
import 'package:map_int/view/utilities/custom_snackbar.dart';

class authentication_service extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future signup_user(
      {required var email, required var password, required var name}) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user?.uid.toString())
          .set({
        "uid": credential.user?.uid.toString(),
        "Name": name,
        "email": email,
        "password": password,
        "type": "user",
        "Logined": false,
        "newtype": true
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        print("the password provided to week");
      }
      if (e.code == "email-already-in-use") {
        print("The account already exists for that email");
      }
      // ignore: avoid_print
      print(e.toString());
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  var isLoading = true.obs;

  Future Login_user({required email, required password}) async {
    try {
      // isLoading(true);

      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = auth.currentUser;

      if (user != null) {
        Get.offAll(() => bottomnavigationbarscreen());
      }
      if (auth.currentUser?.uid.toString() ==
          "xJWFdar1NBXu81sLWMmh8ZeIevX2".toString()) {
        Get.offAll(() => adminscreen());
      } else {
        // ignore: avoid_print
        print("failed");
        isLoading(false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code.toString() == 'user-not-found') {
        // ignore: avoid_print
        print('No user found for that email.');
      } else if (e.code.toString() == 'wrong-password') {
        // ignore: avoid_print
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }

  logout() async {
    await FirebaseAuth.instance
        .signOut()
        .then((value) => Get.offAll(() => browse_or_signinscreen()));
  }

  switchType({var type}) {
    if (type == true) {
      ////type==true means its user type///////////
      FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .update({"newtype": false, "type": "user"});
      userdatasz_controll.fetchData();
    } else {
      /////type == false means its instructor type///
      FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .update({"newtype": true, "type": "Instructor"});
      userdatasz_controll.fetchData();
    }
  }

  Future edit_instructor(
      {required var bio, required  Uint8List profile, var name}) async {
    try {
      String profileLink = await firestore_controll.uploadimagefirebase(
          "profile", profile, true); // isLoading(true);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .update({
        "Name": name,
        "bio": bio,
        "total_courses": "0",
        "profile": profileLink.toString()
      }).then((value) =>
              customsnackbar(titile: "Sucess", messege: "updated", col: gr));
              
    } catch (e) {
      print(e.toString());
    }
  }
}
