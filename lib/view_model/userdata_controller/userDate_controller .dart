import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

var type;
var adminemail;

class user_data_controller extends GetxController {
  var userData = <DocumentSnapshot<Map<String, dynamic>>>[].obs;
  var types = false.obs;

  @override
  void onInit() {
    fetchData(); // Fetch data when the controller is initialized
    super.onInit();
  }

  void fetchData() async {
    CollectionReference<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection('users');
    DocumentSnapshot<Map<String, dynamic>> userData =
        await querySnapshot.doc(FirebaseAuth.instance.currentUser!.uid).get();

    //userData.assignAll(querySnapshot.docs);
    adminemail = userData.data()?["email"] ?? "no email";

    print("${userData.data()?["email"] ?? "no Name"}");

    print(type.toString());
    if (types.value == true) {
      //type = userData[0]["newtype"];
      types.value = userData.data()?["newtype"] ?? "no newtype";
      print("its user");
    } else {
      types.value = userData.data()?["newtype"] ?? "no newtype";
      print("${types.value.toString()}----------------------------->");

      /// type = userData[0]["newtype"];

      print("istructor");
    }
  }

  ////var newList = [homescreen(),search_screen(),const homescreen(),types==true?   homescreen(),user_profile_screen()].obs;
}
